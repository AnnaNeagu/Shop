class OrderItemsController < ApplicationController
    

    def create
        @order = current_order
        @order_item = @order.order_items.new(order_params)
        @order.save
        session[:order_id] = @order.id
        redirect_to baskets_show_path

    end

    # def update
    #     @order = current_order
    #     @order_item = @order.order_items.find(params[:id])
    #     @order_item.update_attribute(order_params)
    #     @order_items = current_order.order_items
    #     redirect_to baskets_show_path
    # end

    def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        # byebug
        
        redirect_to baskets_show_path
    end

    private
    def order_params
        params.require(:order_item).permit(:product_id, :quantity)
    end
end
