class ProductsController < ApplicationController
    def index
        @products = Product.all
        # @order_item = current_order.order_items.new
       
      end
    
      def show
        @product =  Product.find(params[:id])
        @order_item = current_order.order_items.new
      end
end


# URL in browser  -> router
# analize URL -> send matching action in matching controller
# controller will try to match with the view