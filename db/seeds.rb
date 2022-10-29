# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Barrel.create(
  name: 'Wine Barrel', 
  image: 'wine_barrel.jpg', 
  description: '', 
  volume: 60, 
  price: 949.99
)

Barrel.create(
  name: 'Crash Barrel', 
  image: 'crash_barrel.jpg', 
  description: '', 
  volume: 200, 
  price: 299.99
)

Barrel.create(
  name: 'Oil Barrel', 
  image: 'oil_barrel.jpg', 
  description: '', 
  volume: 55, 
  price: 123.99
)
