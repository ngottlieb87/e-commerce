class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @account = Account.find(current_user.id)
    @open_orders = @account.orders
  end
end
