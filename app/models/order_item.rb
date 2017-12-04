class OrderItem < ApplicationRecord
  belongs_to :products
  belongs_to :orders
  validates :quantity, presence: true
end
