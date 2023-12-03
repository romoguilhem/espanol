# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"

puts "Reset database..."

Translation.destroy_all

puts "Done"
puts "-------------------------"
puts "Creating translation..."

filepath = "translations.json"
read = File.read(filepath)
translations = JSON.parse(read)

# puts translations["translations"]

translations["translations"].each do |hash|
  new_translation = Translation.new(french: hash["french"], spanish: hash["spanish"])
  new_translation.save!
end

puts "Done, il y a #{Translation.count} traductions."

