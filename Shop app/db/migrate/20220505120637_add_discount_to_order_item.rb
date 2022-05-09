class AddDiscountToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :discount_percentage, :string
  end
end
