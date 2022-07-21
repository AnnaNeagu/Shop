class AddChecksessionToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :check_session, :integer
  end
end
