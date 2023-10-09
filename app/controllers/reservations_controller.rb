class ReservationsController < ApplicationController
  def new
    @seats = Seat.all
    @reservation = current_user.reservations.create
  end

  def create
    params[:selected_seats].each do |number|
      @reservation = current_user.reservations.create(seat_id: number)
      if @reservation.save
        @reservation.seat.update(status: "booked")
      else
        flash.now[:alert] = "Please select at least one seat."
        @seats = Seat.all
      end
    end
    redirect_to request.referrer
  end

  private

  def reservation_params
    params.require(:reservation).permit(seat_ids: [])
  end
end
