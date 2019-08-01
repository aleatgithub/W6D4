require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do 
  User.create(
    username: Faker::Internet.username
  )
end

100.times do 
  Artwork.create(
    artist_id: rand(1..50),
    image_url: Faker::LoremFlickr.image,
    title: Faker::Book.title
  )
end

25.times do
  ArtworkShare.create(
    artwork_id: rand(1..100),
    viewer_id: rand(1..50)
  )
end

75.times do
  Comment.create(
    user_id: rand(1..50),
    artwork_id: rand(1..100),
    body: Faker::Lorem.paragraphs(1)
  )
end