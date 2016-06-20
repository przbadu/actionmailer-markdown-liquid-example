# 10.times do |i|
#   user = User.find_or_initialize_by(email: "email#{i}@gmail.com", name: "user #{i}")
#   user.save
# end

user = User.find_or_initialize_by(email: 'test@example.com')
user.save

c = Category.create(name: 'Electronics')

c.products.create(name: 'iPhone 7', price: '750')
c.products.create(name: 'Samsung Galaxy s7', price: '750')
c.products.create(name: 'iPad Air', price: '499')
