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

  private

    def seat_params
      params.require(:seat).permit(:seat_no, :seat_price, :status)
    end
end
