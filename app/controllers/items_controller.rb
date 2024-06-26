# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    @product = Product.new
    @event = Event.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash.now[:error] = 'Item was successfully updated.'
      redirect_to items_path
    else
      render :edit
    end
  end

  def update_price
    @item = Item.find(params[:id])
    new_price = params[:item][:price].to_d
    @item.update(price: new_price)
    redirect_to items_path
  end

  def increase_stock
    @item = Item.find(params[:id])
    @item.update(stock: @item.stock + 1)
    redirect_to items_path
  end

  def decrease_stock
    @item = Item.find(params[:id])
    @item.update(stock: @item.stock - 1)
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :stock)
  end
end
