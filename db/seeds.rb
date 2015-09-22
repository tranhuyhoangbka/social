# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  ImagePost.create(title: Faker::Name.title, url: Faker::Internet.url, user_id: [3, 4].sample)
end

10.times do
  TextPost.create(title: Faker::Name.title, body: Faker::Lorem.sentence, user_id: [3, 4].sample)
end
