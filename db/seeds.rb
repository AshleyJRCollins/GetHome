# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Request.destroy_all 
User.destroy_all
user = User.create!(email: "las@wal.com", password: "123456")
Request.create!(starting_location: 'Sodermalm', ending_location: 'future', user: user, status: 2)

