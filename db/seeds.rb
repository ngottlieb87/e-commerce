User.destroy_all
Account.destroy_all
Product.destroy_all
Order.destroy_all
OrderItem.destroy_all

20.times do |index|
  pass = Faker::Internet.password
  user = User.create!(name: Faker::LordOfTheRings.character,
                  email: Faker::Internet.email,
                  password: pass,
                  password_confirmation: pass)
  Account.create!(user_id: user.id)
end

100.times do |index|
  var_price = Faker::Commerce.price
  Product.create!(name: Faker::Commerce.product_name,
                  price: var_price)
end

# 50.times do |index|
#   order = Order.new(status: "Pending",
#                   account_id: rand((Account.first.id)..(Account.last.id)))
#   order_item = OrderItem.new(product_id: rand((Product.first.id)..(Product.last.id)),
#                   quantity: rand(1..10))
#   order.total_price = (Product.find(order_item.product_id)).price * order_item.quantity
#   order.save
#   order_item.order_id = order.id
#   order_item.save
# end


p "Created #{User.count} users"
p "Created #{Account.count} accounts"
p "Created #{Product.count} products"
# p "Created #{Order.count} orders"
# p "Created #{OrderItem.count} order_items"
