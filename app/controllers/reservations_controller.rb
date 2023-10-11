class ReservationsController < ApplicationController
  def index 
    @reservations = Reservation.all
  end

  def show
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
        redirect_to edit_reservation_path	(@reservation)
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
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:success] = 'Booking details updated'
      @reservation.seat.update(status: "booked")
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def accept 
    @reservation = Reservation.find(params[:id])
    if @reservation.update(status: "Accepted")
      SeatBookingMailer.booking_status_email(@reservation, "Accepted").deliver_now
      flash.now[:success] = "Booking Accepted successfully"
    else
      flash.now[:danger] = "Booking not accepted"
    end
    redirect_to reservation_path(@reservation)
  end

  def reject
    @reservation = Reservation.find(params[:id])
    if @reservation.update(status: "Rejected")
      SeatBookingMailer.booking_status_email(@reservation, "Rejected").deliver_now
      flash[:success] = "Booking rejected successfully"
    else
      flash.now[:danger] = "Booking rejection failed"
    end
    redirect_to reservation_path(@reservation)
  end

  private

    def reservation_params
      params.require(:reservation).permit(:reservation_status, :reservation_date, :user_name, :user_email, :gender, :user_age, seat_ids: [])
    end
end
