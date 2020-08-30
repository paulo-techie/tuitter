class RelationshipsController < ApplicationController
  before_action :current_user

  def follow_user
    current_user.follow(clicked_id)
    redirect_to user_path(clicked_id)
  end

  def unfollow_user
    current_user.unfollow(clicked_id)
    redirect_to user_path(clicked_id)
  end

  private 
    def clicked_id
      params[:id]
    end
end
