require "rails_helper"

describe Product do
  it { should have_many :order_items }
  it { should validate_presence_of :price }
  it { should validate_presence_of :name }
end
