# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :name, presence:, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
