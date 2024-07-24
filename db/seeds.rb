# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.connection.execute("TRUNCATE clients CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE buildings CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE custom_fields CASCADE")
ActiveRecord::Base.connection.reset_pk_sequence!('clients')
ActiveRecord::Base.connection.reset_pk_sequence!('buildings')
ActiveRecord::Base.connection.reset_pk_sequence!('custom_fields')

30.times do 
name = Faker::TvShows::Simpsons.character
options = [Faker::TvShows::Simpsons.character, Faker::TvShows::Simpsons.character, Faker::TvShows::Simpsons.character]
client = Client.create(name: name,
  email: Faker::Internet.email(name: name),
  password: '123456'
  )

CustomField::Text.create(client: client, 
  config: { 
    name: 'landlord',
    value: Faker::TvShows::Simpsons.character
  }
  )

CustomField::Integer.create(client: client, 
  config: { 
    name: 'cats',
    value: rand(0...10)
  }
  )

CustomField::Enum.create(client: client, 
  config: { 
    name: 'selected_roomate',
    options: options,
    value: rand(0...options.length)
  }
  )
end

# t.string "street_address"
# t.string "city"
# t.string "state"
# t.string "postcode"
# t.string "country"
60.times do 
client = Client.order('RANDOM()').first
Building.create(client: client,
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  postcode: Faker::Address.postcode,
  country: Faker::Address.country
  )
end

60.times do 
client = Client.order('RANDOM()').first
Building.create(client: client,
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  postcode: Faker::Address.postcode,
  country: Faker::Address.country
  )
end
# CustomField::Text.new(client: Client.find(20), config: { name: 'cats'})