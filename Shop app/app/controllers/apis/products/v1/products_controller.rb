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
      @product =  Product.new(product_params)
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

      # if product.image.attached?
      #   some =  ActionController::Base.helpers.image_tag(product.image)
      # end
      

        formatted_product ={
            id: product.id,
            name: product.name,
            bar_code: product.bar_code,
            price: product.price,
            created_at: product.created_at,
            updated_at: product.updated_at,
            image: product.image
            
        }
        byebug
  end

  def product_params
    params.require(:product).permit(:name, :bar_code, :price,:image)
  end

end