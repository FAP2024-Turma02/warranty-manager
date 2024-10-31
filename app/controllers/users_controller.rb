class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = policy_scope(User)
    render json: @users.map { |user| UserSerializer.call(user) }
  end

  def show
    render json: UserSerializer.call(@user)
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
