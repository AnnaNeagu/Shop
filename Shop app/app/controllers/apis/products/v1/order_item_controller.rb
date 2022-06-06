
class Apis::Products::V1::OrderItemController < ApplicationController
    # protect_from_forgery with: :null_session
        # def index
        #     @order_items = []
        #     OrderItems.all.each do |order_item|
        #         @order_items << get_formatted_order_item(order_item)
        #     end
            
        #     render json: @order_items
        # end

        # def new
        #     @order_item = OrderItem.new
        # end

      def create

        @order = order
        @order_item = @order.order_items.new(order_params)
        @order.guid = SecureRandom.uuid
        if @order.save
            session[:order_id] = @user_id
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
        # @order_item = @order.order_items.find(params[:id])
       
        @order_item .destroy

        if @order_item .destroyed?
          head 200
        end
      end


        private 
        # def get_formatted_order_item(order_item)
        #     formatted_order_item ={
        #         product_id: order_item.product_id,
        #         quantity: order_item.quantity  
        #     }     
        # end

        def order_params
            params.require(:order_item).permit(:product_id, :quantity, :user_id,:order_id)
        end
  end
