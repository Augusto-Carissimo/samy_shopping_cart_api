# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @items = Item.all
    @cart = Cart.first
  end
end
