# frozen_string_literal: true

class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product successfully created.'
    else
      flash.now[:error] = 'Failed to create product.'
    end
    redirect_to items_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :description, :thumbnail)
  end
end
