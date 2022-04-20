class OrderItemsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session

    def create
        @order = current_order
        @order_item = @order.order_items.new(order_params)
        @order.save
        session[:order_id] = @order.id
        redirect_to baskets_show_path

    end

    def edit
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
    end

    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])

        if @order_item.update(order_params)
            @order_items = current_order.order_items
            redirect_to baskets_show_path
        else
            render :edit, status: :unprocessable_entity
        end
     
    end
    
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
