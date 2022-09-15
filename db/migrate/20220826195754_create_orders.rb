# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps

      t.index %i[user_id menu_id], unique: true
    end
  end
end
