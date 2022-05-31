# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Booking.destroy_all
Car.destroy_all
User.destroy_all
puts 'Creating cars..'
puts 'Creating users..'
User.create(email: 'deborah@email.com', password: 'password', first_name: 'Deborah', last_name: 'Reis')
User.create(email: 'chayan@email.com', password: 'password', first_name: 'Chayan', last_name: 'Agarwal')
User.create(email: 'chun@email.com', password: 'password', first_name: 'Chun', last_name: 'Man')
User.create(email: 'ella@email.com', password: 'password', first_name: 'Ella', last_name: 'Herlihy')

def car_prepare
  model = Faker::Vehicle.manufacture
  year = Faker::Vehicle.year
  brand = Faker::Vehicle.make
  location = Faker::Address.city
  description = Faker::Vehicle.transmission
  price = Faker::Number.between(from: 50000, to: 200000)
  features = Faker::Vehicle.standard_specs
  color = Faker::Vehicle.color
  user = User.all.sample.id
  {user_id: user, model: model, year: year, brand: brand, price: price, features: features, color: color, location: location, description: description}
end

20.times do
  fake_users = Car.create(car_prepare)
end

puts 'Creating bookings..'
  Booking.create( start_date: '05/01/2022' , end_date: '06/01/2022', user_id: User.all.sample.id , car_id: Car.all.sample.id  )
  Booking.create( start_date: '04/01/2022' , end_date: '07/01/2022', user_id: User.all.sample.id , car_id: Car.all.sample.id )
  Booking.create( start_date: '03/01/2022' , end_date: '08/01/2022', user_id: User.all.sample.id , car_id: Car.all.sample.id )
  Booking.create( start_date: '02/01/2022' , end_date: '09/01/2022', user_id: User.all.sample.id , car_id: Car.all.sample.id )
  Booking.create( start_date: '01/01/2022' , end_date: '09/01/2022', user_id: User.all.sample.id , car_id: Car.all.sample.id )
