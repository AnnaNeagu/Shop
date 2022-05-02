class OrderItemsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session

    def create
        @order = current_order
        @order_item = @order.order_items.new(order_params)

        @order_item.user_id = current_user.id
        if @order.save
            session[:order_id] = @order.id
            # OrderItems.all.each do |order_items|
            #     if order_items.order_id == OrderItems.last.order_id                   
                    # OrderMailer.with(order_item: @order_item).new_order_email.deliver_now
            # end
            
            flash[:success] = "Thank you for your order! We'll get contact you soon!"
            redirect_to baskets_show_path
        end 

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
        params.require(:order_item).permit!
    end
end
