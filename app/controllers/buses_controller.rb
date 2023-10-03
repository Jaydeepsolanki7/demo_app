class BusesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      @buses = Bus.where("departure_date = ? AND bus_destination = ? AND bus_arrival = ?", params[:search][:departure_date], params[:search][:bus_destination], params[:search][:bus_arrival] )
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.create(bus_params)
    if @bus.save
      redirect_to buses_index_path(@bus)	
    else
      render :new, status: :see_other
    end
  end

  private
  def bus_params
    params.require(:bus).permit!
  end
end
