class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.page params[:page]
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    selected_seats = params[:selected_seats]&.split()
    @reservation = current_user.reservations.new
  end

  def create
    selected_seats = params[:reservation][:seat_ids].split()

    selected_seats.each do |num|
      @reservation = current_user.reservations.create(reservation_params)
      @reservation.bus.seats.find(num.to_i).update(status:"booked", reservation_id: @reservation.id)
    end
    if @reservation.save
      redirect_to bus_reservation_path( params[:bus_id], @reservation)

      flash[:success] = "Seat is booked"
    else
      flash[:danger] = "Please select at least one seat."
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    debugger
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
   
      flash[:success] = 'Booking details updated'

      redirect_to bus_reservation_path( params[:bus_id], @reservation)
    else
      render :edit
    end
  end

  def accept 
    @reservation = Reservation.find(params[:reservation_id])
    if @reservation.update(reservation_status: "accepted")
      SeatBookingMailer.acceptance_email(@reservation).deliver_now
      flash[:success] = "Booking Accepted successfully"
    else
      flash[:danger] = "Booking not accepted"
    end
    redirect_to bus_reservation_path(@reservation)
  end

  def reject
    @reservation = Reservation.find(params[:reservation_id])
    if @reservation.update(reservation_status: "rejected")
      SeatBookingMailer.rejection_email(@reservation).deliver_now
      flash[:success] = "Booking rejected successfully"
    else
      flash[:danger] = "Booking rejection failed"
    end
    redirect_to bus_reservation_path(@reservation)
  end

  private

    def reservation_params
      params.require(:reservation).permit(:reservation_status, :reservation_date, 
                                  :user_name, :user_email, :gender, :user_age, reservation_details_attributes:[:id, :name, :age, :gender, :email, :_destroy])
                                  .merge(bus_id: params[:bus_id])
    end
end
