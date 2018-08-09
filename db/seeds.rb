require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
html_file = open(url).read
a = JSON.parse(html_file).flatten.flatten
b = a.shift
# [{"strIngredient1"=>"Light rum"}, {"strIngredient1"=>"Applejack"}]
a.each do |ingredient_hash|
  Ingredient.create(name: ingredient_hash["strIngredient1"])
end

puts 'Done!'
