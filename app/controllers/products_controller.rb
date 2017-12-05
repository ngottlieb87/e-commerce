class ProductsController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :authorize_admin, only: [:new, :create, :show]
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice]= "Product Created!"
      redirect_to products_path
    else
      render :new
    end
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
