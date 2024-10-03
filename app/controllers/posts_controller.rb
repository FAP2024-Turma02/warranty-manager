class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post, only: [:show, :edit, :update, :destroy]

  def show

  end

  private

  def authorize_post
    authorize @post 
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
