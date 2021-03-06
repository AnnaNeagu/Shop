class OrderItemsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session

    def show
        @orderitems =  OrderItems.find(params[:order_id])
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



    def create
        @order = current_order
        @order_item = @order.order_items.new(order_params)

        @order_item.user_id = current_user.id
        # @order.guid = SecureRandom.uuid.truncate(20)
        @order.guid = SecureRandom.uuid
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

               
            redirect_to baskets_path
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
