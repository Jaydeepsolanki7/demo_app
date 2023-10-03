class WelcomesController < ApplicationController
  def home
    if(!current_user.nil?)
      #
    else
      redirect_to new_user_session_path
    end
  end

  def about
  end

  def contact
  end
end
