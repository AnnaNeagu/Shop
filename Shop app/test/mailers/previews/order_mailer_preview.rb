# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
    def new_order_email
        # Set up a temporary order for the preview  
        current_order = Order.last  
        @order_items = current_order.order_items
        
        @discount = params[:discount]
        OrderMailer.with(order_item: @order_items, total_price: current_order.total, discount: @discount).new_order_email 
      end
end
