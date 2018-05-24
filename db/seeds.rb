# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroy contacts'
Contact.destroy_all

puts 'Creating 50 contacts...'
50.times do |i|
  contact = Contact.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    adress: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number
  )
  puts "#{i + 1}. #{contact.first_name}"
end
puts 'Finished!'
