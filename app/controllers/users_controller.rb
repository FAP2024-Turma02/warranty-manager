class UsersController < ApplicationController
    before_action :authenticate_user!, except: :create
    before_action :set_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Usuário não encontrado" }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
