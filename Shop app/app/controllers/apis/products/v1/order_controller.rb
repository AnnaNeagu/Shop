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


  def show
    @order = Order.find(params[:id])
    array = []

   @order.order_items.each do |order_item|
      array << get_formatted_order_item(order_item)
  
    end 

    if @order.discount.nil?
      disc ="Without discount code!"
      
    else
      disc = @order.discount.name
    end

    time = @order.created_at.strftime(" %m/%d/%Y, %I:%M%p")
    
    render json: {

      

      id: @order.id,
      products: array,
      subtotal: @order.subtotal,
      discount: disc,
      total: @order.total,
      time:time,
      guid: @order.guid 
    }

  end



  def update
    @order = Order.last(session[:order_id])
    if @order.update(order_user)
      head 200
    end

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
           user: order.user,
           discount: disc_val,
           time: order.created_at.strftime(" %m/%d/%Y, %I:%M%p"),
        }
  end

  def get_formatted_order_item(order_item)


        formatted_order_item ={
           id_item: order_item.id,
           id: order_item.product_id,
          
           name:order_item.product.name,
          #  image: url_for(order_item.product.image),
           price: order_item.product.price,
           quantity: order_item.quantity,
           order_id: order_item.order_id,
           total: order_item.total,
           subtotal: order_item.order.subtotal,
          
        }     
  end 

  def order_user
    params.require(:order).permit(:user)
  end

end
