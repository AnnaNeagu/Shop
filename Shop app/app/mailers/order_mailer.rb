class OrderMailer < ApplicationMailer
    def new_order_email
        @order_item = params[:order_item]
        
        @discount = params[:discount]

        puts "*" *20
        puts params
        puts "*" *20
        
        # mail to: User.first.email
         @order_item.each do |item|  
         
          user = User.find_by_id(item[:user_id].to_i)
          # //for rails
          # user = User.find_by_id(item.user_id.to_i)
           @email = user.email
         end 
         
       
        mail(to:  @email, subject: "You got a new order!")
          
      end
end
