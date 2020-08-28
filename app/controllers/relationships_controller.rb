class RelationshipsController < ApplicationController
  def follow_user
    @user = User.find_by! (username: params[:username])
    if current_user.follow @user.id
      redirect_to user_path(@user) 
    end
  end

  def unfollow_user
    @user = User.find_by! (username: params[:username])
    if current_user.unfollow @user.id
      redirect_to user_path(@user)
    end
  end
end
