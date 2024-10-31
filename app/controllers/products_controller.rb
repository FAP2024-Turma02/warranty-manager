class ProductsController < ApplicationController
    
  def index
    @product = Product.all
    render json: @product
  end

  def show
    render json: product
  end

  def create
    @product = Product.create(product_params)
    render json: { status: 'success', message: 'Produto criado com sucesso', data: @product }, status: :created
  end
  
  def update
    authorize product
    
    product.update!(product_params)
    render json: { status: 'success', message: 'Produto atualizado com sucesso', data: @product }, status: :ok
  end


  private

  def product 
    @product ||= Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :serial_number, :warranty_expiry_date, :invoice_id, :store_id)
  end

end
