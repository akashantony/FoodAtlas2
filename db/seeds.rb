# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def user_params
  {
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  }
end

def restaurants_params
  {
    name: Faker::RockBand.name,
    cuisine: Faker::Food.dish,
    longitude:Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    creator_id: User.all.sample.id
  }
end

5.times do
  User.create(user_params)
end

10.times do
  Restaurant.create(restaurants_params)
end


10.times do
  Photo.create({
    user_id: User.all.sample.id,
    restaurant_id: Restaurant.all.sample.id
  })
end
