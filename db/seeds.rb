# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


project = Project.find(105)
50.times do
  title = Faker::App.name
  synopsis = Faker::Hacker.say_something_smart
  temp = Faker::Lorem.word
  location = Faker::Address.city
  project.trials.create!(title: title, synopsis: synopsis, temp: temp, location: location)
end