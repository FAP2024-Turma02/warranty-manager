class UsersController < ApplicationController
  
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  private

  def user
    @user ||= User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
  end
end
