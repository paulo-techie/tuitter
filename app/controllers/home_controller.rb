class HomeController < ApplicationController
  def index
    redirect_to login_path and return unless current_user
    redirect_to user_tueets_path(current_user)
  end
end
