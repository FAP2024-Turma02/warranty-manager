class UsersController < ApplicationController
  def index
    @q = policy_scope(User).ransack(params[:q])
    @users = @q.result.order(id: :asc).uniq
        
    render json: @users.map { |user| UserSerializer.call(user) }
  end

  def show
    authorize user

    render json: UserSerializer.call(user)
  end

  def create
    authorize user
    @user = User.create!(permitted_attributes(User))

    render json: UserSerializer.call(user), status: :created
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
