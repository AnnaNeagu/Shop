
class Apis::Products::V1::OrderItemController < ApplicationController
      def create
        @order = order
        @order_item = @order.order_items.new(order_params)
        @order.guid = SecureRandom.uuid
        if @order.save
            session[:order_id] = @user_id
            head 200 
        end 
      end


      def update
        @order = order
        @order_item = @order.order_items.find(params[:id])
        if @order_item.update(order_params)
            @order_items = current_order.order_items
            head 200       
        end
      end

      def order
        if order_params[:product_id] == 1
          Order.new 
        else  
          Order.last(session[:order_id])
        end
    end

      def destroy 
        
        @order_item = OrderItem.find(params[:id])
        @order_item .destroy

        if @order_item .destroyed?
          head 200
        end
      end


        private 
        def order_params
            params.require(:order_item).permit(:product_id, :quantity, :user_id,:order_id)
        end
  end
