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

    product.update!(permitted_attributes(product)) # Bloqueia `invoice_id` na atualização
    render json: { status: 'success', message: 'Produto atualizado com sucesso', data: product }, status: :ok
  end

  def destroy
    authorize product

    product.destroy
    render_deletion_message('Product')
  end
  
  private

  def product
    @product ||= Product.find(params[:id])
  end

end
