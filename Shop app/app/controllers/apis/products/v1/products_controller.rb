class Apis::Products::V1::ProductsController < ApplicationController
  def index
    @products = []
    Product.all.each do |product|
        @products << get_formatted_product(product)
    end
    render json: @products
    end

    def new
      @product = Product.new
    end

    def create
      # byebug
      @product =  Product.new(product_params)
      logger.debug @product.errors.full_messages
      if @product.save
        head 200 
      end
    end

    def edit
      @product =  Product.find(params[:id])
    end
  
    def update
      @product =  Product.find(params[:id])
  
      if @product.update(product_params)
        head 200
      end
    end

    def destroy
      @product =  Product.find(params[:id])
      @product.destroy
      if @product.destroyed?
        head 200
      end
    end
    

    private 
    def get_formatted_product(product)

      if product.image.attached?
        some =  url_for(product.image)
      end

        formatted_product ={
            id: product.id,
            name: product.name,
            bar_code: product.bar_code,
            price: product.price,
            image: some,
            description: product.description,
            created_at: product.created_at,
            updated_at: product.updated_at
        }     
  end

  def product_params
    params.require(:product).permit(:name, :bar_code, :picture, :price, :description)
  end
end