class Order < ApplicationRecord
  belongs_to :account
  has_many :order_items
  # has_many :products
  # validates :total_price, presence: true
  # validates :status, presence: true

  before_save :update_total
  before_create :update_status

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  private

  def update_status
    if self.status == nil?
      self.status =  "In progess"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
end
