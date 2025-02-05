class UsersController < ApplicationController
  def index
    authorize User
    @q = policy_scope(User).ransack(params[:q]) # Adicionando Ransack
    @users = @q.result

    render json: @users.map { |user| UserSerializer.call(user) }
  end

  def show
    authorize user
    render json: UserSerializer.call(user)
  end

  def create
    authorize User
    @user = User.create!(permitted_attributes(User))
    render json: UserSerializer.call(@user), status: :created
  end

  def update
    authorize user
    user.update!(permitted_attributes(User))
    render json: UserSerializer.call(user), status: :ok
  end

  def destroy
    authorize user
    user.destroy
    head :no_content
  end

  private

  def user
    @user ||= User.find(params[:id])
  end
end
