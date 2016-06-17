10.times do |i|
  User.create!(email: "email#{i}@gmail.com", name: "user #{i}")
end
