class TueetsController < ApplicationController
  def index
    @tueets = Tueet.all.order("created_at DESC")
    @users = User.all
  end

  def show
    @tueet = Tueet.find(params[:id])
  end

  def new
  end

  def create
    @tueet = Tueet.new(tueet_params)
    @tueet.user_id = current_user.id

    @tueet.save
    redirect_to user_tueets_path
  end

  private
    def tueet_params
      params.require(:tueet).permit(:tueet)
    end
end
