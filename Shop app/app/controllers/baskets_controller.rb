class BasketsController < ApplicationController

  def show
    @order_items = current_order.order_items
    
    if session[:discount]
      @discount = session[:discount]
      session.delete(:discount)    
    end  
  end

  def create
    @order_items = current_order.order_items
    OrderMailer.with(order_item: @order_items, discount: discount_param).new_order_email.deliver_now
   end

   private
      def discount_param
        params.require(:basket).permit(:percent)
      end

end
