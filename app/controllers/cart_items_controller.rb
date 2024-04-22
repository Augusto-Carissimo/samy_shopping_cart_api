class CartItemsController < ApplicationController
  # before_action :set_cart_item

  def increase_quantity
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(quantity: @cart_item.quantity + 1)
      redirect_to root_path
    else
      flash[:error] = "Failed to increase quantity: #{@cart_item.errors}"
      redirect_to root_path
    end
  end

  def decrease_quantity
    @cart_item = CartItem.find(params[:id])

    if @cart_item.quantity > 0
      if @cart_item.update(quantity: @cart_item.quantity - 1)
        redirect_to root_path
      else
        flash[:error] = "Failed to decrease quantity: #{@cart_item.errors}"
        redirect_to root_path
      end
    else
      flash[:error] = "Quantity cannot be less than 0"
      redirect_to root_path
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
