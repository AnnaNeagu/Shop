class Order < ApplicationRecord
    has_many :order_items
    before_save  :set_subtotal
    belongs_to :discount, optional: true

    def subtotal
        order_items.collect{|order_item| order_item.valid? ? order_item.unit_price*order_item.quantity : 0}.sum
    end

    # def calculate_total(discount = 0)
        
    #     self.total = total
    #     self.save
    # end

    private
    def set_subtotal
        self[:subtotal] = subtotal
    end
end
