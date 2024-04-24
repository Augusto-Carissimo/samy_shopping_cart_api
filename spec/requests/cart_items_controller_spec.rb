# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  let(:item) { FactoryBot.create(:item) }
  let!(:cart_item) { FactoryBot.create(:cart_item, item: item) }

  describe 'POST #create' do
    context 'when cart item exists' do
      it 'increases the quantity' do
        post :create, params: { item_id: item.id }
        cart_item.reload
        expect(cart_item.quantity).to eq(2)
      end
    end

    context 'when cart item does not exist' do
      let(:new_item) { FactoryBot.create(:item) }
      it 'builds a new cart item' do
        expect {
          post :create, params: { item_id: new_item.id }
        }.to change(CartItem, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the cart item' do
      delete :destroy, params: { id: cart_item.id }
      expect(response).to redirect_to(root_path)
      expect(CartItem.exists?(cart_item.id)).to be_falsey
    end
  end

  describe 'PATCH #increase_quantity' do
    it 'increases the quantity by 1' do
      patch :increase_quantity, params: { id: cart_item.id }
      cart_item.reload
      expect(cart_item.quantity).to eq(2)
    end
  end

  describe 'PATCH #decrease_quantity' do
  let(:new_item) { FactoryBot.create(:item) }
  let(:new_cart_item) { FactoryBot.create(:cart_item, item: new_item, quantity: 2) }
    it 'decreases the quantity by 1' do
      patch :decrease_quantity, params: { id: new_cart_item.id }
      new_cart_item.reload
      expect(new_cart_item.quantity).to eq(1)
    end

    it 'destroys the cart item if quantity becomes zero' do
      cart_item.update(quantity: 1)
      patch :decrease_quantity, params: { id: cart_item.id }
      expect(CartItem.exists?(cart_item.id)).to be_falsey
    end
  end
end
