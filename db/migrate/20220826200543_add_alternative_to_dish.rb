# frozen_string_literal: true

class AddAlternativeToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :alternative, :boolean, default: false, null: false
  end
end
