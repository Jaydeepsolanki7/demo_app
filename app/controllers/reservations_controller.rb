class ReservationsController < ApplicationController
  def index 
    @reservations = Reservation.all.page params[:page]
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @seats = Seat.all
    @reservation = current_user.reservations.new
  end

  def create
    params[:selected_seats].each do |number|
      @reservation = current_user.reservations.create(seat_id: number)
    end
    if @reservation.save
      redirect_to edit_bus_reservation_path(params[:bus_id], @reservation) and return
      flash[:success] = "Seat is booked"
    else
      flash[:danger] = "Please select at least one seat."
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:success] = 'Booking details updated'
      @reservation.seat.update(status: "booked")
      redirect_to bus_reservation_path(params[:bus_id], @reservation)
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
    redirect_to bus_reservation_path(params[:bus_id], @reservation)
  end

  def reject
    @reservation = Reservation.find(params[:reservation_id])
    if @reservation.update(reservation_status: "rejected")
      SeatBookingMailer.rejection_email(@reservation).deliver_now
      flash[:success] = "Booking rejected successfully"
    else
      flash[:danger] = "Booking rejection failed"
    end
    redirect_to bus_reservation_path(params[:bus_id], @reservation)
  end

  private

    def reservation_params
      params.require(:reservation).permit(:reservation_status, :reservation_date, :user_name, :user_email, :gender, :user_age, seat_ids: [])
    end
end
