puts "Starting Faker..."

User.create!(name: "Admin",
  username: "admin0",
  address: "Tầng 13 Toà nhà Keangnam, Hà Nội",
  phone_number: "0988888888",
  email: "admin@mobileworld.com",
  password: "admin111",
  password_confirmation: "admin111",
  role: 1,
  admin: true,
  created_at: Time.zone.now)

puts "Faker is generating data... Please wait..."

19.times do |n|
  name  = Faker::Name.name
  username = "user0000#{n+1}"
  address = Faker::Address.full_address
  phone_number = "0900000000"
  email = "user-#{n+1}@mobileworld.com"
  password = "user0000"
  User.create!(name: name,
    username: username,
    address: address,
    phone_number: phone_number,
    email: email,
    password: password,
    password_confirmation: password,
    created_at: Time.zone.now)
end

puts "Created #{User.count} users!"

Category.create!(name: "Phone")
Category.create!(name: "Tablet")
Category.create!(name: "Laptop")
Category.create!(name: "Accessory")

Manufacture.create!(name: "Samsung")
Manufacture.create!(name: "Apple")
Manufacture.create!(name: "Nokia")
Manufacture.create!(name: "LG")
Manufacture.create!(name: "Dell")
Manufacture.create!(name: "HP")
Manufacture.create!(name: "Acer")
Manufacture.create!(name: "Asus")

Product.delete_all
Product.create!(name: "Samsung Galaxy S9", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S9", price: "20000000", quantity: "100")
Product.create!(name: "iPhone X", category_id: "1", manufacture_id: "2",
  description: "iPhone X", price: "18000000", quantity: "100")
Product.create!(name: "Nokia 1100i", category_id: "1", manufacture_id: "3",
  description: "Nokia 1100i", price: "500000", quantity: "100")
Product.create!(name: "Macbook Air", category_id: "3", manufacture_id: "2",
  description: "Macbook Air", price: "30000000", quantity: "100")
Product.create!(name: "Samsung Galaxy S2", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S2", price: "20000000", quantity: "100")
Product.create!(name: "Samsung Galaxy S3", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S3", price: "20000000", quantity: "100")
Product.create!(name: "Samsung Galaxy S4", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S4", price: "20000000", quantity: "100")
Product.create!(name: "Samsung Galaxy S5", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S5", price: "20000000", quantity: "100")
Product.create!(name: "Samsung Galaxy S6", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S6", price: "20000000", quantity: "100")
Product.create!(name: "Samsung Galaxy S7", category_id: "1", manufacture_id: "1",
  description: "Samsung Galaxy S7", price: "20000000", quantity: "100")

puts "Created #{Product.count} products!"

puts "Done!"
