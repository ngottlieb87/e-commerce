class ChargesController < ApplicationController
  def new
    @amount = current_user.account.orders.first.total_price
  end

  def create
    # Amount in cents
    @amount = current_user.account.orders.first.total_price
    binding.pry
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => user.id,
      :amount      => @amount,
      :description => 'Rails Stripe Customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
