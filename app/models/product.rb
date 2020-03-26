class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one_attached :photo
  monetize :price_cents



  # def get_product_recipes(product)
  #   require 'open-uri'
  #   ingredient = product.scrap
  #   title = []
  #   url = "https://www.750g.com/recherche.htm?sort=best_rating&search=#{ingredient}"
  #   html_file = open(url).read
  #   html_doc = Nokogiri::HTML(html_file)
  #   html_doc.search('.c-row__body h2').each do |element|
  #     title << element.text
  #   end
  #   return title
  # end

  # def get_product_links(product)
  #   require 'open-uri'
  #   ingredient = product.scrap
  #   ingredients = []
  #   url = "https://www.750g.com/recherche.htm?sort=best_rating&search=#{ingredient}"
  #   html_file = open(url).read
  #   html_doc = Nokogiri::HTML(html_file)
  #   html_doc.search('.c-recipe-row__title a').take(3).map do |element|
  #     doc = Nokogiri::HTML(open('https://www.750g.com' + element.attribute('href').value).read)
  #     ingredients << doc.search(".c-recipe-ingredients li")
  #   end
  #   return ingredients
  # end

  # def get_recipe(product)
  #   require 'open-uri'
  #   ingredient = product.scrap
  #   recipe = []
  #   url = "https://www.750g.com/recherche.htm?sort=best_rating&search=#{ingredient}"
  #   html_file = open(url).read
  #   html_doc = Nokogiri::HTML(html_file)
  #   html_doc.search('.c-recipe-row__title a').take(3).map do |element|
  #     doc = Nokogiri::HTML(open('https://www.750g.com' + element.attribute('href').value).read)
  #     recipe << doc.search(".c-recipe-steps__item-content p")
  #   end
  #   return recipe
  # end
end
