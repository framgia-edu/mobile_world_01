puts "Starting Faker..."

User.create!(name: "Admin",
  username: "admin0",
  address: "Tầng 13 Toà nhà Keangnam, Hà Nội",
  phone_number: "0988888888",
  email: "admin@mobileworld.com",
  password: "admin111",
  password_confirmation: "admin111",
  role: 1,
  created_at: Time.zone.now)

puts "Faker is generating data... Please wait..."

19.times do |n|
  name  = Faker::Name.name
  username = "user0000#{n+1}"
  address = Faker::Address.full_address
  phone_number = "0900000000"
  email = "user-#{n+1}@mobileworld.com"
  password = "user0000"
  User.create!(name:  name,
    username: username,
    address: address,
    phone_number: phone_number,
    email: email,
    password: password,
    password_confirmation: password,
    created_at: Time.zone.now)
end

puts "Created #{User.count} users!"

puts "Done!"
