class BasketsController < ApplicationController
 
 
  def show
    @order_items = current_order.order_items

    if session[:discount]
      @discount = session[:discount]
      session.delete(:discount)
      
    end
  end

end
