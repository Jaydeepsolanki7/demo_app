class BusesController < ApplicationController
  before_action :authenticate_user!
  # after_action :create_seats_for_bus

  def index
    if params[:search]
      @buses = Bus.where("departure_date = ? AND bus_destination = ? AND bus_arrival = ?", params[:search][:departure_date], params[:search][:bus_destination], params[:search][:bus_arrival] )
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @seats = @bus.seats
  end

  def new
    @route = Route.find(params[:route_id])

    @bus = @route.buses.new
  end

  def create
    @route = Route.find(params[:route_id])

    @bus = @route.buses.create(bus_params)
    if @bus.save
      create_seats_for_bus(@bus)
    end 
    redirect_to routes_index_path(@route)
  end

  private

    def bus_params
      params.require(:bus).permit!
    end
    
    def create_seats_for_bus(bus)

      (1..bus.capacity).each do |seat|
        @bus.seats.create(seat_no: seat)
      end
    end
end
