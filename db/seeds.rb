# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "-------------------------- Lancement de la seed --------------------------"
puts "-------------------------- Creation des contacts --------------------------"
contact = Contact.new(email: "contact@tiroiraterroirs.com", address: "EURL DE BEAU PRINTEMPS, <br>24 rue des Marguerites, <br>57410, Petit-Rederching", phone: "03.87.98.98.98")
contact.save
# USERS
puts "-------------------------- Création Users --------------------------"
admin = User.new(first_name: "admin", admin: true, email: "admin@admin.com", password:"123456")
admin.save

# PRODUCTS
puts "-------------------------- Création Products --------------------------"

filet = Product.new(name: "2 Steak de Filet de Boeuf AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 750, image_url:"assets/fdb.png", show_image_url:"fdb.png", stock: 50, price_cents: 1000, final_price: 14.2, ppk: 45, pod: true, scrap: "filet-de-boeuf")
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242118/Filetdeboeuf_evgipk.png")
filet.photo.attach(io: file, filename: "filetdeboeuf.png", content_type: "image/png")
filet.save

# -------------------------------------------------------------------

steak = Product.new(name: "2 Steaks AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 40 ,price_cents: 1000, final_price: 10.5, ppk: 25, scrap: "steak")
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steakboeuf_ush8yv.jpg")
steak.photo.attach(io: file, filename: "steakboeuf.jpg", content_type: "image/jpg")
steak.save

# -------------------------------------------------------------------

potaufeu = Product.new(name: "2,5kg spécial Pot-au-Feu AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 900, image_url:"assets/potaufeu.jpg", show_image_url:"potaufeu.jpg", stock: 150, price_cents: 500, final_price: 33.7, ppk: 5)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Potaufeu_zofvdk.jpg")
potaufeu.photo.attach(io: file, filename: "potaufeu.jpg", content_type: "image/jpg")
potaufeu.save

# -------------------------------------------------------------------

roulades = Product.new(name: "4 Roulades AB 10€", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/roulades.jpg", show_image_url:"roulades.jpg", stock: 5550, price_cents: 1000, final_price: 10)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Roulade_ompexm.jpg")
roulades.photo.attach(io: file, filename: "roulades.jpg", content_type: "image/jpg")
roulades.save

# -------------------------------------------------------------------

steakhaches= Product.new(name: "40 Steaks Hachés Surgelés AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakhache.png", show_image_url:"steakhache.png", stock: 5550, price_cents: 7500, final_price: 75)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steak_hache_fxgae3.jpg")
steakhaches.photo.attach(io: file, filename: "steakhaches.jpg", content_type: "image/jpg")
steackhaches.save

# -------------------------------------------------------------------

viandedeboeuf = Product.new(name: "5kg Viande de Boeuf AB - Variante Pot Au Feu", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/potaufeu.jpg", show_image_url:"potaufeu.jpg", stock: 5550, price_cents: 5000, final_price: 100)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steakboeuf_ush8yv.jpg")
viandedeboeuf.photo.attach(io: file, filename: "viandedeboeuf.jpg", content_type: "image/jpg")
viandedeboeuf.save

# -------------------------------------------------------------------

viandedeboeufhache = Product.new(name: "5kg Viande de Boeuf AB - Variante Haché", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 5000, final_price: 100)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steakboeuf_ush8yv.jpg")
viandedeboeufhache.photo.attach(io: file, filename: "viandedeboeufhache.jpg", content_type: "image/jpg")
viandedeboeufhache.save

# -------------------------------------------------------------------

viandedeveau = Product.new(name: "5kg Viande de Veau AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/viandedeveau.png", show_image_url:"viandedeveau.png", stock: 5550, price_cents: 5000, final_price: 125)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585560606/viandedeveau_mmlyzn.png")
viandedeveau.photo.attach(io: file, filename: "viandedeveau.png", content_type: "image/png")
viandedeveau.save

# -------------------------------------------------------------------

boncadeau = Product.new(name: "Bon Cadeau - Agriculture Biologique", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 1, price_cents: 1, final_price: 1)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steakboeuf_ush8yv.jpg")
boncadeau.photo.attach(io: file, filename: "boncadeau.jpg", content_type: "image/jpg")
boncadeau.save

# -------------------------------------------------------------------

bourguignon = Product.new(name: "Bourguignon AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/bourguignon.png", show_image_url:"bourguignon.png", stock: 5550, price_cents: 500, final_price: 10)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585220876/RK6o4zfc9g3KqikcZHCzTnhk.png")
bourguignon.photo.attach(io: file, filename: "bourguignon.png", content_type: "image/png")
bourguignon.save

# -------------------------------------------------------------------

leprefere = Product.new(name: "Colis \"Le Préféré\" 10kg Viande de Boeuf AB Variante Haché", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 5000, final_price: 160)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585220876/RK6o4zfc9g3KqikcZHCzTnhk.png")
bourguignon.photo.attach(io: file, filename: "bourguignon.png", content_type: "image/png")
leprefere.save

# -------------------------------------------------------------------

lepreferepotaufeu = Product.new(name: "Colis \"Le Préféré\" 10kg Viande de Boeuf AB Variante Pot Au Feu", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/potaufeu.jpg", show_image_url:"potaufeu.jpg",  stock: 500, price_cents: 5000, final_price: 160)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Potaufeu_zofvdk.jpg")
lepreferepotaufeu.photo.attach(io: file, filename: "lepreferepotaufeu.jpg", content_type: "image/jpg")
lepreferepotaufeu.save

# -------------------------------------------------------------------

viandeveaubcp = Product.new(name: "Colis 10kg Viande de Veau AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/viandedeveau.png", show_image_url:"viandedeveau.png", stock: 5550, price_cents: 5000, final_price: 210)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585560606/viandedeveau_mmlyzn.png")
viandeveaubcp.photo.attach(io: file, filename: "viandeveaubcp.png", content_type: "image/png")
viandeveaubcp.save

# -------------------------------------------------------------------

colisdecouverte = Product.new(name: "Colis Découverte 2,5kg spécial Steak / Steak Hachés AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 2000, final_price: 52.5)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steakboeuf_ush8yv.jpg")
colisdecouverte.photo.attach(io: file, filename: "colisdecouverte.jpg", content_type: "image/jpg")
colisdecouverte.save

# -------------------------------------------------------------------

cotedeboeuf = Product.new(name: "Côte de Boeuf AB", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus ratione molestias provident id, porro nesciunt.", weight: 1750, image_url:"assets/steakboeuf.png", show_image_url:"steakboeuf.png", stock: 5550, price_cents: 1000, final_price: 39)
file = URI.open("https://res.cloudinary.com/du5gskfdu/image/upload/v1585242117/Steakboeuf_ush8yv.jpg")
cotedeboeuf.photo.attach(io: file, filename: "cotedeboeuf.jpg", content_type: "image/jpg")
cotedeboeuf.save

# -------------------------------------------------------------------


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
