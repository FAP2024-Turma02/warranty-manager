class ProductsController < ApplicationController
    
    def index
        @product = Product.all
        render json: @product
    end

    def show
        render json: product
    end

    def create
        @product = Product.new(product_params)
        if @product.save
          render json: { status: 'success', message: 'Produto criado com sucesso', data: @product }, status: :created
        else
          render json: { status: 'error', message: 'Falha ao criar produto', errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
        else
          render :edit, status: :unprocessable_entity
        end
    end


    private

    def product 
        @product ||= Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Product not found' }, status: :not_found
    end

    def product_params
        params.require(:product).permit(:name, :price, :serial_number, :warranty_expiry_date, :invoice_id, :store_id)
    end

end
