# frozen_string_literal: true

class AddStockItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :stock, :integer, default: 0
  end
end
