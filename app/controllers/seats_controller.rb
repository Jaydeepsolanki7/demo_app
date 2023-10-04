class SeatsController < ApplicationController
  def new
    @seat = Seat.new
  end
  
  def create
    @bus = Bus.find(params[:bus_id])
    if @bus.available == true
      @seat = @bus.seats.create(seat_params)
      redirect_to bus_path(@bus)
      elsif
        flash.now[:danger] = "Bus is Not Available"
    else
      render :new, status: :see_other
    end
  end

  private

  def seat_params
    params.require(:seat).permit(:seat_no, :status)
  end
end
