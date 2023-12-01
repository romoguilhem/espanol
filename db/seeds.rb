# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"

translations = { translations: [
  {
    french: "chat",
    spanish: "gato",
    category: ["animaux"]
  },
  {
    french: "chien",
    spanish: "perro",
    category: ["animaux"]
  },
  {
    french: "lapin",
    spanish: "conejo",
    category: ["animaux"]
  },
  {
    french: "oiseau",
    spanish: "pajaro",
    category: ["animaux"]
  },
  {
    french: "souris",
    spanish: "raton",
    category: ["animaux"]
  },
  {
    french: "chat",
    spanish: "gato",
    category: ["animaux"]
  },
  {
    french: "chatte",
    spanish: "gata",
    category: ["animaux"]
  },
  {
    french: "chien",
    spanish: "perro",
    category: ["animaux"]
  },
  {
    french: "chienne",
    spanish: "perra",
    category: ["animaux"]
  },
  {
    french: "éléphant",
    spanish: "elefante",
    category: ["animaux"]
  },
  {
    french: "crabe",
    spanish: "cangrejo",
    category: ["animaux"]
  },
  {
    french: "canard",
    spanish: "pato",
    category: ["animaux"]
  },
  {
    french: "petit déjeuner",
    spanish: "desayuno",
    category: ["cuisine"]
  },
  {
    french: "déjeuner",
    spanish: ["cuisine"]
  },
  {
    french: "manteau",
    spanish: "abrigo",
    category: ["vétements"]
  },
  {
    french: "les vétements",
    spanish: "la ropa",
    category: ["vétements"]
  },
  {
    french: "jupe",
    spanish: "falda",
    category: ["vétements"]
  },
  {
    french: "lunettes",
    spanish: "gafas",
    category: ["vétements"]
  },
  {
    french: "costume",
    spanish: "traje",
    category: ["vétements"]
  },
  {
    french: "chaussettes",
    spanish: "calcetines",
    category: ["vétements"]
  },
  {
    french: "robe",
    spanish: "vestido",
    category: ["vétements"]
  },
]}

File.open("translations.json", "wb") do |file|
  file.write(JSON.generate(translations))
end
