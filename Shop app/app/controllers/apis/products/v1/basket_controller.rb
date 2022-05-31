
class Apis::Products::V1::BasketController < ApplicationController
  def index
    # @order_items = current_order.order_items
    
    # if session[:discount]
    #   @discount = session[:discount]
    #   #session.delete(:discount)       
    # end  


    @order_items  =  []
    # @last = OrderItem.last.order_id
    OrderItem.all.each do |order_item|
       
            @order_items << get_formatted_order_item(order_item)

            # if order_item.order_id == @last
            #     @order_items = []
            #     @order_items << get_formatted_order_item(order_item)
            # end
        
       
    end
    render json: @order_items
    # byebug
  end

  private 
    def get_formatted_order_item(order_item)

    #   if product.image.attached?
    #     some =  url_for(product.image)
    #   end

        formatted_order_item ={
           id_item: order_item.id,
           id: order_item.product_id,
           bar_code: order_item.product.bar_code,
           name:order_item.product.name,
           image: url_for(order_item.product.image),
           price: order_item.product.price,
           quantity: order_item.quantity,
           order_id: order_item.order_id,
           total: order_item.total,
           subtotal: order_item.order.subtotal,
        }     
  end

end