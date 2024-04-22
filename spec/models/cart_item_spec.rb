# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItem do
  let!(:item) { FactoryBot.create(:item, stock: 10) }

  describe 'associations' do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:cart) }
  end

  describe 'validation' do
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end

  describe "check for sufficient stock" do
    it "is valid when quantity is less than or equal to stock" do
      cart_item_valid = CartItem.new(item: item, cart: Cart.create, quantity: 5)
      expect(cart_item_valid).to be_valid
    end

    it "is invalid when quantity is more than stock" do
      cart_item_invalid = CartItem.new(item: item, cart: Cart.create, quantity: 15)
      expect(cart_item_invalid).not_to be_valid
      expect(cart_item_invalid.errors[:quantity]).to include("there is not stock for this item")
    end
  end

  describe 'check uniqueness of item in cart' do
    let(:cart_item) { FactoryBot.create(:cart_item, item: item) }

    it 'cant add item to cart if already exists in it' do
      cart_item_with_existing_item_in_cart = CartItem.new(item: cart_item.item, cart: cart_item.cart)
      expect(cart_item_with_existing_item_in_cart).not_to be_valid
    end
  end
end