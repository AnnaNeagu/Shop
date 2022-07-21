class CreateCheckSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :check_sessions do |t|
      t.integer :value

      t.timestamps
    end
  end
end
