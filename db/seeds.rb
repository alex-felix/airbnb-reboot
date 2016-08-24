# frozen_string_literal: true
require 'faker'

location1 = Location.create!(name: 'Dishoom', description: 'Best indian in shoreditch', address: 'Shoreditch road', postcode: 'W8 6EF', city: 'London', country: 'UK')
location2 = Location.create!(name: 'El Castel', description: 'Best mexican in camden', address: 'Super road', postcode: 'SW11 3JS', city: 'London', country: 'UK')
location3 = Location.create!(name: "King's Palace", description: 'Best italian in victoria', address: 'shoreditch road', postcode: 'E1 6BT', city: 'London', country: 'UK')
location4 = Location.create!(name: 'Chez Gervais', description: 'Best french in south kensington', address: 'shoreditch road', postcode: 'W8 6EF', city: 'London', country: 'UK')

sam = User.create!(first_name: 'Sam', last_name: 'Appleseed', address: 'Shoreditch', city: 'London', gender: 'Male', email: 'sam.appleseed@gmail.com', phone_number: '07449949576', postcode: 'W8 6EF', date_of_birth: Date.new(1994, 8, 29), password: 'toto')
mike = User.create!(first_name: 'Mike', last_name: 'Julien', address: 'Pimlico', city: 'London', gender: 'Male', email: 'mike.julien@gmail.com', phone_number: '07449949576', postcode: 'W8 6EF', date_of_birth: Date.new(1969, 8, 29), password: 'titi')

Event.create!(title: 'Movie Night: Finding Dory', description: 'I am organising a viewing of Finding Dory on my brand new home cinema. Join me if you am up to watching it!', interests: ['movies', 'movie night', 'chill'], starts_at: DateTime.new(2016, 8, 26), ends_at: DateTime.new(2016, 8, 26), user: sam, location: location1)
Event.create!(title: "Let's go play tennis together!", description: 'I am looking for a second tennis player to come play with me on Saturday afternoon. I have already booked the cours in holland park.', interests: %w(sports tennis social), starts_at: DateTime.new(2016, 8, 30, 16, 0, 0), ends_at: DateTime.new(2016, 8, 30, 20, 0, 0), user: mike, location: location2)
Event.create!(title: 'Going for a drink in Shoreditch', description: 'Up for some drinks in shoeditch anyone? I was thinking about going to the water poet maybe?', interests: ['drinks', 'after-work', 'social'], starts_at: DateTime.new(2016, 8, 26), ends_at: DateTime.new(2016, 8, 26), user: sam, location: location1)
Event.create!(title: 'Club at Mayfair', description: 'I have money, I got a table, come join!', interests: %w(clubs mayfair drinking), starts_at: DateTime.new(2016, 8, 26), ends_at: DateTime.new(2016, 8, 26), user: sam, location: location1)

7.times do
  user = User.new(
    first_name: Faker::Name.first_name, #=> "Kaci",
    last_name: Faker::Name.last_name, #=> "Ernser",
    address: Faker::Address.street_address, #=> "282 Kevin Brook",
    city: Faker::Address.city, #=> "Imogeneborough",
    gender: %w(Male Female Unknown).sample,
    email: Faker::Internet.email, #=> "kirsten.greenholt@corkeryfisher.info"
    phone_number: Faker::Number.number(10), #=> "1968353479",
    postcode: 'W8 6EF',
    date_of_birth: Faker::Date.between(2.days.ago, Date.today), #=> "Wed, 24 Sep 2014"
    password: Faker::Lorem.word, #=> "repellendus"
  )
  user.save
end

7.times do
  event = Event.new(
    title: Faker::Lorem.word,
    description: Faker::Lorem.characters(30),
    interests: %w(outdoors citytrip sport nightlife home).sample,
    starts_at: Faker::Time.backward(14, :evening), #=> "2014-09-17 19:56:33 -0700"
    ends_at: Faker::Time.forward(23, :morning), # => "2014-09-26 06:54:47 -0700"
    user: sam,
    location: location1
  )
  event.save
end
