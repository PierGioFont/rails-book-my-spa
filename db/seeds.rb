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

Massage.create(name: 'Instant lift', spa_id: spa.id, description: 'Soin du visage', price: 60)
Massage.create(name: 'Soin essentiel minceur', spa_id: spa.id, description: 'Gommages et modelages', price: 65)
Massage.create(name: 'Bain à la vigne rouge', spa_id: spa.id, description: 'Bains et soins', price: 75)
Massage.create(name: 'Instant pureté', spa_id: spa.id, description: 'Soins du visage', price: 52)
Massage.create(name: 'Gommage divin', spa_id: spa.id, description: 'Gommages et modelages', price: 62)
Massage.create(name: 'Journée céleste', spa_id: spa.id, description: 'Bain japonais avec arômes et fleurs', price: 62)
Massage.create(name: 'Rituel du Maghreb', spa_id: spa.id, description: 'Gommages purifiant au savon noir', price: 62)



