class AddUserToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user, :string
  end
end
