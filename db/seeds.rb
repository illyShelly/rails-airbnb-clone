# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# UNCOMMENT UPLOADER IN MODEL FLAT WHILE SEEDING
puts "Cleaning DB"

Flat.destroy_all
User.destroy_all
Booking.destroy_all

puts "Creating users ..."
puts ""

user1 = User.create!(email: "a@a.a", password: "password")
user2 = User.create!(email: "b@b.b", password: "password")

puts "Creating flats ..."
puts ""

 flat1 = Flat.create!(name: "Awesome flat", description: "Central location in Barcelona", photo: "https://images.unsplash.com/photo-1534238175617-1238558644bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80", price: 1000, address: "Carrer de Vinaros, 15, Barcelona", location: "Barcelona", capacity: 4, user_id: User.all.sample.id)

 flat2 = Flat.create!(name: "New and refurbished", description: "Central apartment", photo: "https://images.unsplash.com/photo-1536142347359-3397ed8941cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60", price: 5000, address: "Calle de Velázquez, 8, 28001 Madrid, Spain", location: "Madrid", capacity: 4, user_id: User.all.sample.id)

 flat3 = Flat.create!(name: "Beautiful flat", description: "Beautiful view in ...", photo: "https://images.unsplash.com/photo-1472207241423-9e30d66d4b0f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80", price: 2000, address: "Travessera De Dalt 121-123, 08024 Barcelona, Spain", location: "Barcelona", capacity: 3, user_id: User.all.sample.id)

 flat4 = Flat.create!(name: "Flat in wonderful Barcelona", description: "Visit all the attractions in the city center. Everything is close...", photo: "https://images.unsplash.com/photo-1519998203158-48b796d5cbfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60", price: 1500, address: "Carrer Comte d'Urgell, 232, 08036 Barcelona, Spain", location: "Barcelona", capacity: 5, user_id: User.all.sample.id)

 flat5 = Flat.create!(name: "Perfect location", description: "Cosy studio in the amazing part of Barcelona", photo: "https://images.unsplash.com/photo-1529179781123-34632c8d5272?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60", price: 4000, address: "Carrer de Balmes, 145, Barcelona", location: "Barcelona", capacity: 3, user_id: User.all.sample.id)

 flat6 = Flat.create!(name: "Central flat in Madrid", description: "Everything what you can wish", photo: "https://images.unsplash.com/photo-1544366981-c61d1d56925e?ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", price: 2000, address: "Glorieta de Bilbao, 4, 28004 Madrid, Spain", location: "Madrid", capacity: 2, user_id: User.all.sample.id)

 flat7 = Flat.create!(name: "Nice flat", description: "Perfect flat near to the beach", photo: "https://images.unsplash.com/photo-1451153378752-16ef2b36ad05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1947&q=80", price: 2500, address: "Carrer de Santander, Barcelona", location: "Barcelona", capacity: 2, user_id: User.all.sample.id)

 flat8 = Flat.create!(name: "Royal view for you", description: "Luxury flat in the perfect location", photo: "https://images.unsplash.com/photo-1550647512-8b8a24d4f646?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=976&q=80", price: 2000, address: "150 Piccadilly, St. James's, London W1J 9BR, UK", location: "London", capacity: 3, user_id: User.all.sample.id)

 flat9 = Flat.create!(name: "Flat of your dreams", description: "Beautiful flat in Madrid", photo: "https://images.unsplash.com/photo-1517659649778-bae24b8c2e26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60", price: 3500, address: "Calle de San Bernardo, 4, 3º, 28013 Madrid, Spain", location: "Madrid", capacity: 2, user_id: User.all.sample.id)


puts "#{User.count} created users"
puts "*" * 20
puts "#{Flat.count} created flats"
puts ""
puts "Finish seeding"
