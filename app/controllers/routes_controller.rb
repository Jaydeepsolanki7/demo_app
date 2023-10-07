class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end
  
  def show
    @route = Route.find(params[:id])
    buses = @route.buses
  end
  
  def new
    @route = Route.new
  end

  def create
    @route = Route.create!(route_params)
    if @route.save
      redirect_to routes_index_path	
    else
      render :new, status: :see_other
    end
  end


  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    if @route.update(route_params)
      redirect_to @route
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def route_params
    params.require(:route).permit(:route_name, :distance)
  end
end
