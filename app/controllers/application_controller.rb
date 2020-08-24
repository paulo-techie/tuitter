class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def current_user
      User.find_by(username: session[:username]) ||
      User.where(id: session[:user_id]).first
    end

    helper_method :current_user
end
