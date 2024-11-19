class StoresController < ApplicationController
  def index
    @stores = policy_scope(Store)
    authorize @stores
    render_success(@stores.map { |store| StoreSerializer.call(store) })
  end

  def show
    authorize store

    render_success(StoreSerializer.call(@store))
  end

  def create
    authorize Store
    @store = Store.create(store_params)

    render_success(StoreSerializer.call(@store), status: :created)
  end

  def update
    authorize store
    store.update(store_params)
    
    render_success(StoreSerializer.call(@store))
  end

  def destroy
    authorize store
    store.destroy
    
    head :no_content
  end

  private

  def store
    @store ||= Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address, :contact)
  end
end
