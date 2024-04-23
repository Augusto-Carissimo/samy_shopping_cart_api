# frozen_string_literal: true

class AddDefaultItemPrice < ActiveRecord::Migration[7.0]
  def change
    change_column_default :items, :price, 0.0
  end
end
