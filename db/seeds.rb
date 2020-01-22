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
filet = Product.new(name: "2 Steak de Filet de Boeuf AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 750, image_url:"assets/fdb.png", show_image_url:"fdb.png", stock: 50, price_cents: 1000, final_price: 14.2)
filet.save
steak = Product.new(name: "2 Steaks AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 40 ,price_cents: 1000, final_price: 10.5)
steak.save
potaufeu = Product.new(name: "2,5kg spécial Pot-au-Feu AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 900, image_url:"assets/potaufeu.jpg", show_image_url:"potaufeu.jpg", stock: 150, price_cents: 500, final_price: 33.75)
potaufeu.save
roulades = Product.new(name: "4 Roulades AB 10€", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/roulades.jpg", show_image_url:"roulades.jpg", stock: 5550, price_cents: 1000, final_price: 10)
roulades.save
steackhaches= Product.new(name: "40 Steaks Hachés Surgelés AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakhache.png", show_image_url:"steakhache.png", stock: 5550, price_cents: 7500, final_price: 75)
steackhaches.save
viandedeboeuf = Product.new(name: "5kg Viande de Boeuf AB - Variante Pot Au Feu", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/potaufeu.jpg", show_image_url:"potaufeu.jpg", stock: 5550, price_cents: 5000, final_price: 100)
viandedeboeuf.save
viandedeboeufhache = Product.new(name: "5kg Viande de Boeuf AB - Variante Haché", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 5000, final_price: 100)
viandedeboeufhache.save
viandedeveau = Product.new(name: "5kg Viande de Veau AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/viandedeveau.png", show_image_url:"viandedeveau.png", stock: 5550, price_cents: 5000, final_price: 125)
viandedeveau.save
boncadeau = Product.new(name: "Bon Cadeau - Agriculture Biologique", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 1, price_cents: 1, final_price: 1)
boncadeau.save
bourguignon = Product.new(name: "Bourguignon AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/bourguignon.png", show_image_url:"bourguignon.png", stock: 5550, price_cents: 500, final_price: 10)
bourguignon.save
leprefere = Product.new(name: "Colis \"Le Préféré\" 10kg Viande de Boeuf AB Variante Haché", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 5000, final_price: 160)
leprefere.save
lepreferepotaufeu = Product.new(name: "Colis \"Le Préféré\" 10kg Viande de Boeuf AB Variante Pot Au Feu", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/potaufeu.jpg", show_image_url:"potaufeu.jpg",  stock: 500, price_cents: 5000, final_price: 160)
lepreferepotaufeu.save
viandeveaubcp = Product.new(name: "Colis 10kg Viande de Veau AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/viandedeveau.png", show_image_url:"viandedeveau.png", stock: 5550, price_cents: 5000, final_price: 210)
viandeveaubcp.save
colisdecouverte = Product.new(name: "Colis Découverte 2,5kg spécial Steak / Steak Hachés AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 2000, final_price: 52.5)
colisdecouverte.save
cotedeboeuf = Product.new(name: "Côte de Boeuf AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 1000, final_price: 39)
cotedeboeuf.save

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
