class SeatsController < ApplicationController
  # before_action :creating_seats

  def new
    @bus = Bus.find(params[:bus_id])
    @seats = @bus.seats
  end

  def create
    @bus = Bus.find(params[:bus_id])
    if @bus.available == true
      @seat = @bus.seats.create(seat_params)
      redirect_to bus_path(@bus)
    else
      render :new, status: :see_other
    end
  end

  def edit
    @seat = Seat.find(params[:id])
    @seats = Seat.all
  end

  def update
    @seats = Seat.all
    @seat = Seat.find(params[:id])
    if @seat.update(seat_params)
      redirect_to bus_path
    end
  end

  def update_multiple_seats
    selected_seat_ids = params[:selected_seats]

    if selected_seat_ids.blank?
      redirect_to buses_path, alert: 'Please select at least one seat to update.'
    else
      selected_seat_ids.each do |seat_id|
        seat = Seat.find(seat_id)
        if seat.update(status: !seat.status?)
          SeatBookingMailer.acceptance_email(seat).deliver_now
        end
      end

      redirect_to seats_path, notice: 'Selected seats have been updated successfully.'
    end
  end

  private

  def seat_params
    params.require(:seat).permit(:seat_no, :availablity)
  end

end
