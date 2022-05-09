class AddDiscountToOrder < ActiveRecord::Migration[7.0]

  def change
    add_column :orders, :discount_id, :integer
    add_foreign_key :orders, :discounts
  end
end
