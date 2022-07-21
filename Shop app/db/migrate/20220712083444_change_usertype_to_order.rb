class ChangeUsertypeToOrder < ActiveRecord::Migration[7.0]
    def change
      change_column :orders, :user, :integer
    end
end
