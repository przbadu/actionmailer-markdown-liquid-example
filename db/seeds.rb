10.times do |i|
  user = User.find_or_initialize_by(email: "email#{i}@gmail.com", name: "user #{i}")
  user.save
end


User.first.posts.create!(name: 'First Post', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea expedita tempora dignissimos voluptatem assumenda voluptas quae sapiente laborum! Ea totam, harum iste nam est laudantium porro temporibus quibusdam non rem.')
