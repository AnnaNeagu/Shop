class OrderController < ApplicationController

    
    def send_email
        @order_items = current_order.order_items
        @discount = session[:discount]
        OrderMailer.with(order_item: @order_items, discount: @discount).new_order_email.deliver_now
        
    end

  

    def show
        @order =  Order.find(params[:id])
        # byebug
        # @order_item = current_order.order_items.new
        # OrderItem.all.each do |value|
        #    byebug
        #     if value.order_id == @order.id
        #        @order_item = value.product
        #        @name  = value.product.name
        #        @price = value.product.price
        #     end
        # end
        
        respond_to do |format|
          format.html
          format.json
        end
      end

      private
      def product_params
        params.require(:order).permit!
      end
    # def product_params
    #     params.require(:order_item).permit(:name,:order_id)
    #   end
end
