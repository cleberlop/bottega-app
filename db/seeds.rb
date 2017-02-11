User.create(email: "test@test.com", password: "asdfasdf")

2.times do |room|
  Room.create(name: "Room #{room}", capacity: 1, description: "rooms")
end

puts "Two rooms created"