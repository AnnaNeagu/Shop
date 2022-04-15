class ProductsController < ApplicationController
    def index
        @products = Product.all
        # @order_item = current_order.order_items.new
       
      end
    
      def show
        @product =  Product.find(params[:id])
        @order_item = current_order.order_items.new
      end


      def new
        @product = Product.new
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to @product
        else
           render :new, status: :unprocessable_entity
        end
      end  

      private
      def product_params
        params.require(:product).permit(:name, :bar_code, :price, :image, :description)
      end
end


# URL in browser  -> router
# analize URL -> send matching action in matching controller
# controller will try to match with the view