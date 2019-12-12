# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
constance = User.create!(first_name:"Constance", last_name:"Graftieaux", address:"Av. Bartolomeu Mitre, 1314 ", photo:"https://upload.wikimedia.org/wikipedia/commons/7/75/Joseph_Morgan_at_PaleyFest_2014.jpg", email:"constance@hotmail.com", password:"123456")

