# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.boolean :draft, default: true, null: false
      t.date :menu_for

      t.timestamps

      t.index :menu_for, unique: true
    end
  end
end
