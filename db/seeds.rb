
# creating test user
puts 'Creating 1 test user... pass testing'
User.create!(
  email: "testing@testing.com",
  username: "testing",
  password: "testing"
)
puts 'TEST users created!'

# creating users
puts 'Creating 10 fake users...'
10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    password: "testing"
  )
end
puts 'Fake users created!'

10.times do
  Garden.create!(
    user_id: rand(1..9),
    title: Faker::Company.catch_phrase, 
    address: Faker::Address.street_address, 
    price: rand(10..140)
  )
end

# creating bookings
puts 'Creating 30 fake bookings...'
30.times do
  Booking.create(
    start_date: DateTime.now,
    end_date: DateTime.now + 1,
    user_id: rand(1..10),
    garden_id: rand(1..10)
  )
end
puts 'Finished!'