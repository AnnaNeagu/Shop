# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

grapes = Product.create(name: "Grapes", bar_code: "shyd5tf8", price: 0.6, image: "grape.jpg", description: "These grapes were grown in Greece. They come from the Natural Products farm. They have a superior quality being grown with natural rooting")
apple = Product.create(name: "Apple", bar_code: "shyd5tg7", price: 0.3, image: "apple.jpg")
banana = Product.create(name: "Banana", bar_code: "shyd5ty8", price: 0.5, image: "banana.jpg")
avovado = Product.create(name: "Avocado", bar_code: "shy05tf8", price: 0.4, image: "avocado.jpg")

