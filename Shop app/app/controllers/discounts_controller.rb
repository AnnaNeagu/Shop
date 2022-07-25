class DiscountsController < ApplicationController
    def update
        discount = Discount.where(code: discount_param[:code])
      
        if discount
          session[:discount] = discount[0].percent
       
          if session[:discount]
          session[:discount_code] = discount[0].code
           else
          flash[:notice] = "Discount code is invalid!  v1"
          # flash[:notice] = "Discount code has been applied!"
           end
          # byebug
        else
          flash[:notice] = "Discount code is invalid! v2"       
        end
      end
    
      private
      def discount_param
        params.require(:discount).permit(:code)
      end
end
