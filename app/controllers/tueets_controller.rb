class TueetsController < ApplicationController
  before_action :require_current_user

  def index
    @tueets = Tueet.all.order("created_at DESC")
    @users = User.all.order("created_at DESC")
  end

  def show
    @tueet = Tueet.find(params[:id])
  end

  def new
  end

  def create
    @tueet = Tueet.new(tueet_params)
    @tueet.user_id = current_user.id

    flash[:errors] = 'Invalid tueet! Try again ...' unless @tueet.save
    redirect_to user_tueets_path
  end

  private
    def tueet_params
      params.require(:tueet).permit(:tueet)
    end

    def require_current_user
      redirect_to login_path unless current_user
    end
end
