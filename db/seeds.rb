# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Starting seed phase'

puts 'Creating places'
Place.create(name: 'ZOLA', latitude: 52.496140, longitude: 13.422210)
Place.create(name: 'Home', latitude: 52.502973, longitude: 13.397017)

puts 'Finished seed phase'
