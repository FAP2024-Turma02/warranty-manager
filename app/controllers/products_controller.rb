class ProductsController < ApplicationController
  def index
    @q = policy_scope(Product).ransack(params[:q])
    @products = @q.result(distinct: true).order(id: :asc)
    
    render json: @products.map { |product| ProductSerializer.call(product) }
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
