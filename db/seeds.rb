# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spa.destroy_all
User.destroy_all

user = User.new(email: 'adrienpoly@gmail.com', password: '123456')
user.save

Spa.create(name: 'caudalie', user_id: user.id, description: 'super spa dans les vignes', country: 'france')
