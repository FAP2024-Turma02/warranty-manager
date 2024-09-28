class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
