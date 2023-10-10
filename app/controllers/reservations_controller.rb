class ReservationsController < ApplicationController
  def index 
    @reservations = Reservation.all
  end

  def show
    @bus = Bus.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def new
    @seats = Seat.all
    @reservation = current_user.reservations.create
  end

  def create
    
    params[:selected_seats].each do |number|
      @reservation = current_user.reservations.create(seat_id: number)
      if @reservation.save
        @reservation.seat.update(status: "booked")
        redirect_to edit_reservation_path	(@reservation)
        SeatBookingMailer.acceptance_email(@reservation).deliver_now
        flash.now[:success] = "Seat is booked"
      else
        flash.now[:danger] = "Please select at least one seat."
        @seats = Seat.all
      end
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
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_status, :reservation_date, :user_name, :user_email, :gender, :user_age, seat_ids: [])
  end
end
