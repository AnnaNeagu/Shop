class Apis::Products::V1::OrdersController < ApplicationController

    @@user_id = 0
 
    # byebug
    def create
        user =  Order.new(order_params)
         
        @@user_id = user.user
        # if @@user_email
        #     head 200
        # end
    end

    @@user_id
    # byebug
    def index
        @orders  =  []
        Order.all.each do |order|
            if order.user == @@user_id
                # byebug
               @orders << get_formatted_order(order)
               
           end
        end

         render json: @orders
        #  byebug

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
             user: order.user,
          }
    end

    def order_params
        params.require(:order).permit(:user)
    end
  
 end