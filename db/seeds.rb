# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Ash Ketchup', email: 'ash_ketchup@pokemon.com', password: 'derpderpderp')
user2 = User.create(name: 'Mega Man', email: 'mega_man@legends.com', password: 'whatever')
Favorite.create(user_id: user1.id, ninja_id: "1", place_name: "Cookie Center", thumbnail_url: "bkabkabkabka")
Favorite.create(user_id: user1.id, ninja_id: "2", place_name: "Poke Center", thumbnail_url: "blablablabla")
Favorite.create(user_id: user2.id, ninja_id: "1", place_name: "Cookie Center", thumbnail_url: "bkabkabkabka")
Favorite.create(user_id: user2.id, ninja_id: "2", place_name: "Poke Center", thumbnail_url: "blablablabla")
Favorite.create(user_id: user2.id, ninja_id: "3", place_name: "some mega man reference", thumbnail_url: "whatever")