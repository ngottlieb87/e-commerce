class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @order_item = current_order.order_items.new
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).require(:name, :price)
  end
end
