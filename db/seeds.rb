require "open-uri"

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

gardens_urls = [
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget11-561x842_e2pbsl.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget20-561x842_mwaufl.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119007/gardens/front-yard-ideas-on-a-budget25-561x842_jlodkn.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget10-561x842_camfia.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119007/gardens/front-yard-ideas-on-a-budget23-561x842_c1d7lo.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119007/gardens/front-yard-ideas-on-a-budget22-561x842_qdmp9i.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1628119006/gardens/front-yard-ideas-on-a-budget18-561x842_u27kuh.jpg"
]

10.times do
  garden = Garden.create!(
    user_id: rand(1..9),
    title: Faker::Company.catch_phrase, 
    address: Faker::Address.street_address, 
    price: rand(10..140),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    )
  file = URI.open(gardens_urls.sample)
  garden.photo.attach(io: file, filename: 'photo.jpg') 
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

