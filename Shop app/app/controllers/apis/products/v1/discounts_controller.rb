
class Apis::Products::V1::DiscountsController < ApplicationController
 def index
 end
    def update
      @order = Order.last(session[:order_id])
      discount = Discount.where(code: discount_param[:code])

      Discount.all.each do |value|
        
        if discount[0].nil?
          if discount.update(discount_param)
            discount_id = 14
            @order.discount_id = discount_id
   
            if @order.save
             head 200    
            end   
          end 
          
        else 
          if discount[0].code == value.code
            if discount.update(discount_param)
              discount_id = discount[0].id
              @order.discount_id = discount_id
    
              if @order.save
              head 200    
              end    
              break 
            end
          end
         
      end
    end

     

        # if discount
        #     session[:discount] = discount[0].percent
        #     if session[:discount]
        #             session[:discount_code] = discount[0].code
        #     else
        #             flash[:notice] = "Discount code is invalid!  v1"
        #     end  
        # else
        #   flash[:notice] = "Discount code is invalid! v2" 
        # end
      
      end
    
      private
      def discount_param
        params.require(:discount).permit(:code)
      end

      def order_params
        params.require(:order).permit(:discount_id)
      end
end