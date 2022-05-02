class OrderMailer < ApplicationMailer
    def new_order_email
        @order_item = params[:order_item]
        @discount = params[:discount]
        # mail to: User.first.email
        mail(to: "miaa49265@gmail.com", subject: "You got a new order!")
      end
end
