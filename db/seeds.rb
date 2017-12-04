User.destroy_all
Account.destroy_all
Question.destroy_all
Response.destroy_all

20.times do |index|
  pass = Faker::Internet.password
  user = User.create!(name: Faker::LordOfTheRings.character,
                  email: Faker::Internet.email,
                  password: pass,
                  password_confirmation: pass)
  Account.create!(user_id: user.id)
end

100.times do |index|
  Products.create!(name: Faker::Zelda.item,
                  price: Faker::Commerce.price)
end

50.times do |index|
  order = Order.new!(status: "Pending",
                  account_id: rand((Account.first.id)..(Account.last.id)))
  order_item = Order_item.new!(product_id: rand((Product.first.id)..(Product.last.id)),
                  order_id: rand((Account.first.id)..(Account.last.id)),
                  quantity: rand(1..10))
  order.total_price = (Product.find(order_item.product_id)).price * order_item.quantity
  order.save
  order_item.order_id = order.id
end


p "Created #{User.count} users"
p "Created #{Question.count} questions"
p "Created #{Response.count} responses"
