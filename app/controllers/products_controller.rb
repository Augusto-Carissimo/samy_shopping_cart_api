class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product successfully created.'
      redirect_to products_path
    else
      flash.now[:error] = 'Failed to create product.'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :description, :thumbnail)
  end
end
