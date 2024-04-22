class CartItem < ApplicationRecord
  belongs_to :item, required: true
  belongs_to :cart, required: true

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  validate :quantity_cannot_be_more_than_stock
  validate :item_must_be_unique_in_cart

  private

  def quantity_cannot_be_more_than_stock
    if item.present? && quantity.present? && quantity > item.stock
      errors.add(:quantity, "there is not stock for this item")
    end
  end

  def item_must_be_unique_in_cart
    if CartItem.exists?(cart_id: cart_id, item_id: item_id)
      errors.add(:item_id, "already exists in the cart")
    end
  end
end
