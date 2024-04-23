class CartItemsController < ApplicationController
  before_action :set_cart_item, except: [:create]

  def create
    if cart_item = CartItem.find_by(item_id: params[:item_id])
      if cart_item.update(quantity: cart_item.quantity + 1)
      else
        flash[:error] = cart_item.errors
      end
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
    if @cart_item.update(quantity: @cart_item.quantity + 1)
      redirect_to root_path
    else
      flash[:error] = @cart_item.errors
      redirect_to root_path
    end
  end

  def decrease_quantity
    if @cart_item.quantity > 0
      if @cart_item.update(quantity: @cart_item.quantity - 1)
        if @cart_item.quantity.zero?
          @cart_item.destroy
        end
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
    CartItem.create!(item: Item.find(params[:item_id]), cart: cart, quantity: 1)
  end
end
