# db/seeds.rb
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all
Cocktail.destroy_all

puts 'Calling API...'
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)["drinks"]

puts 'Creating ingredients...'
ingredients_attributes = ingredients.map { |i| { name: i["strIngredient1"] } }
Ingredient.create!(ingredients_attributes)

cocktails_attributes = [
  { name: 'mojito', url: 'cocktails.jpg' },
  { name: "ti' punch", url: 'cocktails.jpg' },
  { name: "White Russian", url: 'cocktails.jpg'}
]
Cocktail.create!(cocktails_attributes)
puts 'Finished!'
