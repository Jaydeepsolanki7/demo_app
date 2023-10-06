class BookingsController < ApplicationController
  before_action :authenticate_user! 
  def create
    render "seats/show"
  end
end