class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  def index
    authorize Product
    @q = policy_scope(Product).ransack(params[:q])
    @products = @q.result

    render json: @products.map { |product| ProductSerializer.call(product) }
  end

  def show
    authorize @product
    render json: ProductSerializer.call(@product)
  end

  def create
    @product = Product.new(permitted_attributes(Product))
    authorize @product

    @product.save!
    render json: ProductSerializer.call(@product), status: :created
  end

  def update
    authorize @product
    @product.update!(permitted_attributes(@product))
    render json: ProductSerializer.call(@product), status: :ok
  end

  def destroy
    authorize @product
    @product.destroy

    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
