class ProductsController < ApplicationController
  def index
    @product = policy_scope(Product)

    render json: @product.map { |product| ProductSerializer.call(product) }
  end

  def show
    authorize product

    render json: ProductSerializer.call(product)
  end

  def create
    @product = Product.new(permitted_attributes(Product.new))
    authorize @product

    @product.save!
    render json: ProductSerializer.call(@product), status: :created
  end

  def update
    authorize product

    attributes = permitted_attributes(product).except(:invoice_id)

    product.update!(attributes)
    render json: ProductSerializer.call(product), status: :ok
  end

  def destroy
    authorize product

    product.destroy
    head :no_content
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end
end
