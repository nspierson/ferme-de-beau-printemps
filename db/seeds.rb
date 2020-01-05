# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "-------------------------- Lancement de la seed --------------------------"
# USERS
puts "-------------------------- Création Users --------------------------"
admin = User.new(first_name: "admin", admin: true, email: "admin@admin.com", password:"123456")
admin.save

# PRODUCTS
puts "-------------------------- Création Products --------------------------"
filet = Product.new(name: "Filet de Boeuf", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 750, stock: 50, price_cents: 10000)
filet.save
steak = Product.new(name: "Steak de Boeuf", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 750, stock: 40 ,price_cents: 20000)
steak.save
faux_filet = Product.new(name: "Faux-filet de Boeuf", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 900, stock: 150, price_cents: 75000)
faux_filet.save
vrai_filet = Product.new(name: "Vrai-filet de Boeuf", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, stock: 5550, price_cents: 117500)
vrai_filet.save

# ORDERS
puts "-------------------------- Création Orders --------------------------"
# order = Order.new(user_id: 1, state: "pending")
# order.save

# CATEGORY
puts "-------------------------- Création Categories --------------------------"
cat_viande_boeuf = Category.new(name: "Viande de boeuf")
cat_viande_boeuf.save
cat_viande_autre = Category.new(name: "Viande autre")
cat_viande_autre.save

puts "-------------------------- Fin de la seed --------------------------"
