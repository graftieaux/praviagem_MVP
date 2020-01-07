# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Order.destroy_all
Meal.destroy_all
User.destroy_all

constance = User.create!(first_name:"Constance", last_name:"Graftieaux", photo:"https://upload.wikimedia.org/wikipedia/commons/7/75/Joseph_Morgan_at_PaleyFest_2014.jpg", email:"constance@hotmail.com", password:"123456")

pasta = Meal.create!(category: "Italian", time: "12h-14h", description:"pasta"  ,newprice: 10, quantity: 2)
cookies = Meal.create!(category: "Padaria", time: "12h-14h", description:"Doces"  ,newprice: 25, quantity: 2)

order = Order.create( customer_id: "1", meal_id: "pasta", quantity: 1)
