class BusesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      @buses = Bus.where("departure_date = ? AND bus_destination = ? AND bus_arrival = ?", params[:search][:departure_date], params[:search][:bus_destination], params[:search][:bus_arrival] )
    end
  end
   

  def new
  end

end
