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
    @route = Route.find(params[:route_id])
    @bus = @route.buses.create(bus_params)
    @bus.save 
    redirect_to routes_show_path(@route)
  end

  private
  def bus_params
    params.require(:bus).permit!
  end
end
