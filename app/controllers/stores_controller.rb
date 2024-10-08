class StoresController < ApplicationController
  before_action :set_store, only: :show

    def index
    @stores = Store.all
    render json: @stores
  end

    def show
    render json: @store
  end

  private

  def set_store
    @store = Store.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Store not found" }, status: :not_found
  end
end