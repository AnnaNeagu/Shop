class Apis::Products::V1::OrdersController < ApplicationController

    @@user_email = 0
 
    
    def create
        
        user =  Order.new(order_params)
        # byebug
        @@user_email = user.user
        # if @@user_email
        #     head 200
        # end
           
    end

    @@user_email
    # byebug
    def index
        @orders  =  []
        Order.all.each do |order|
            if order.user == @@user_email
                # byebug
               @orders << get_formatted_order(order)
               
           end
        end
         render json: @orders

    end
    
    private
      def get_formatted_order(order)
        if order.discount_id.nil?
          disc_val = "The discount was not applied!"
        else
          disc_val = order.discount.name
        end
  
          formatted_order ={
             id: order.id,
             total: order.total,
             subtotal: order.subtotal,
             guid: order.guid,
             discount: disc_val,
             time: order.created_at.strftime(" %m/%d/%Y, %I:%M%p"),
          }
    end

    def order_params
        params.require(:order).permit(:user)
    end
  
 end