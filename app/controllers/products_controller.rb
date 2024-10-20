class ProductsController < ApplicationController
    
    def index
        @products = Product.all
        render json: @products
    end

    def show
        render json: product
    end

    private

    def product 
        @products ||= Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Product not found' }, status: :not_found
    end

end
