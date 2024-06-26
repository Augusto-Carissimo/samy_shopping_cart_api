# frozen_string_literal: true

class AddQuantityCartItem < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :quantity, :integer, default: 0
  end
end
