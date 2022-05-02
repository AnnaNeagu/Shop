class OrderController < ApplicationController

    def send_email
        @order_items = current_order.order_items
        OrderMailer.with(order_item: @order_items).new_order_email.deliver_now
    end
end
