class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])

    render 'new', notice: 'Invalid login' and return unless user
    session[:user_id] = user.id
 
    redirect_to user_tueets_path(user)
  end

  # def auth
  #   username = params[:username].to_s
  #   user = User.find_by_username(username)

  #   redirect_to 'login_path' and return if !user
  #   session[:user_id] = user.id
    
  #   redirect_to user, notice: 'You are signed in!'
  # end

  def destroy
    session[:user_id] = nil   
    redirect_to root_url, notice: 'Logged out!'   
  end
end
