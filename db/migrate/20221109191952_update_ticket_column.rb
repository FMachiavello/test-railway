class UpdateTicketColumn < ActiveRecord::Migration[7.0]
  def change
    remove_index :tickets, :user_id
    add_index :tickets, :user_id, unique: true
    change_column :tickets, :last_update, :date, null: false
  end
end
