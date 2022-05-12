class OrderController < ApplicationController

    
    def send_email
        @order_items = current_order.order_items
        @discount = session[:discount]
        OrderMailer.with(order_item: @order_items, discount: @discount).new_order_email.deliver_now
        
    end

    def create
        
    end
end
