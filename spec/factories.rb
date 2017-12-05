FactoryBot.define do

  factory(:user) do
    name('gregor')
    email('g@g.com')
    password('password')
  end

  factory(:admin, class: User) do
    name('admin')
    email('admin@admin.com')
    password('admin')
    admin(true)
  end

  factory(:product) do
    name('Socks')
    price(12.00)
    image_url("sock.jpeg")
  end

  factory(:product_edit, class: Product) do
    user_id{ FactoryBot.create(:admin).id}
    name("JammyJams")
    price(15.00)
    image_url("pjs.jpeg")
  end
end
