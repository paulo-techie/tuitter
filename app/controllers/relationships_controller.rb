class RelationshipsController < ApplicationController
  def follow_user
    @user = User.find_by(username: parama[:username])
    if current_user.follow @user.id
      respond_to redirect_to root_path 
    end
  end

  def unfollow_user
    @user = User.find_by(username: parama[:username])
    if current_user.unfollow @user.id
      respond_to redirect_to root_path
    end
  end
end
