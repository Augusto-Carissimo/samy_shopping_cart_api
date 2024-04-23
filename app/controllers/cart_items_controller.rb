# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, except: [:create]

  def create
    if (cart_item = CartItem.find_by(item_id: params[:item_id]))
      flash[:error] = cart_item.errors unless cart_item.update(quantity: cart_item.quantity + 1)
    else
      build_cart_item
    end
    redirect_to root_path
  end

  def destroy
    @cart_item.destroy
    flash[:error] = 'Item removed from cart successfully.'
    redirect_to root_path
  end

  def increase_quantity
    flash[:error] = @cart_item.errors unless @cart_item.update(quantity: @cart_item.quantity + 1)
    redirect_to root_path
  end

  def decrease_quantity
    if @cart_item.quantity.positive?
      if @cart_item.update(quantity: @cart_item.quantity - 1)
        @cart_item.destroy if @cart_item.quantity.zero?
      else
        flash[:error] = @cart_item.errors
      end
    end
    redirect_to root_path
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def build_cart_item
    cart = Cart.first_or_create
    CartItem.create!(item: Item.find(params[:item_id]), cart:, quantity: 1)
  end
end
