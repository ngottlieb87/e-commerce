class Order < ApplicationRecord
    belongs_to :account
    has_many :order_items
    validates :total_price, presence: true
    validates :status, presence: true
end
