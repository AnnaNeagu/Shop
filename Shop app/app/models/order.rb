class Order < ApplicationRecord
    has_many :order_items
    before_save  :set_subtotal
    belongs_to :discount, optional: true
    
    def subtotal    
        total = order_items.collect{|order_item| order_item.valid? ? order_item.unit_price*order_item.quantity : 0}.sum
    end

    

    # byebug
    def total
       
        if discount.nil?
            subtotal 
            
        else
            if discount.percent.nil? 
                
            else
                subtotal-subtotal*discount.percent
            end
            # byebug
        end

    end

    # def calculate_total(discount = 0)
    #     total = 0 
    #     subtotal += subtotal
    #     if discount > 0 
    #         subtotal / discount =  total
    #     end
    #     self.total = total
    #     self.save
    # end
       
    

    private
    def set_subtotal
        self[:subtotal] = subtotal
    end

end
