# frozen_string_literal: true

class CreateDishMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_menus do |t|
      t.references :menu, null: false, foreign_key: true, index: false
      t.references :dish, null: false, foreign_key: true

      t.timestamps

      t.index %i[menu_id dish_id], unique: true
    end
  end
end
