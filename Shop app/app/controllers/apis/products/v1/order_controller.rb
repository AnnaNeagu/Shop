class Apis::Products::V1::OrderController < ApplicationController
  def index
    @order  =  []
    # @order = OrderItem.last.order_id
    @last = OrderItem.last.order_id
    Order.all.each do |order|

    # byebug
             if order.id == @last
                # @order_items = []
                @order << get_formatted_order(order)
            end
           
    end
    render json: @order
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
           discount_id: disc_val,
        }
  end

end