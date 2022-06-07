class BasketsController < ApplicationController

  def order
    @order_items = current_order.order_items
    
    if session[:discount]
      @discount = session[:discount]
      #session.delete(:discount)  
    end    
  end

  def mail_with_order
    @order_items = current_order.order_items

  end
  def show
    @order_items = current_order.order_items
    
    if session[:discount]
      @discount = session[:discount]
      #session.delete(:discount)  
      flash[:notice] = "Discount code has been applied!"
    else
      flash[:alert] = "You did not enter a discount code or the discount code is invalid!"
    

    end    
  end

  def create
    @order = Order.find_by_id(session[:order_id])
    if @order
      # unless session[:discount_code].present?
        @discount = Discount.find_by(code: session[:discount_code]) 
        @order.discount = @discount
        @order.save
        
      # end
      #  @order.calculate_total()
    end
    # byebug
    @order_items = current_order.order_items
    OrderMailer.with(order_item: @order_items).new_order_email.deliver_now
    
   
  end

  private
      def discount_param
        params.require(:discount).permit(:code)
      end
end
