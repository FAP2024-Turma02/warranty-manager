class StoresController < ApplicationController
  def index
    @stores = policy_scope(Store)
    authorize @stores
    render_success(@stores.map { |store| StoreSerializer.call(store) })
  end

  def show
    @store = Store.find(params[:id])
    authorize @store
    render_success(StoreSerializer.call(@store))
  end

  def create
    @store = Store.new(store_params)
    authorize @store
    @store.save ? render_success(StoreSerializer.call(@store), status: :created) : render_failure(@store)
  end

  def update
    @store = Store.find(params[:id])
    authorize @store
    @store.update(store_params) ? render_success(StoreSerializer.call(@store)) : render_failure(@store)
  end

  def destroy
    @store = Store.find(params[:id])
    authorize @store
    @store.destroy
    head :no_content
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :contact)
  end
end
