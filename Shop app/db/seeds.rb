# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Product.find_or_create_by(bar_code: "shyd5tf8").update_attributes(name: "Grape",price: 12.0, image: "grape.jpg", description: "These grapes were grown in Greece. They come from the Natural Products farm. They have a superior quality being grown with natural rooting")
# grapes = Product.create(name: "Grape", bar_code: "shyd5tf8", price: 12.0, image: "grape.jpg", description: "These grapes were grown in Greece. They come from the Natural Products farm. They have a superior quality being grown with natural rooting")
# avovado = Product.create(name: "Avocado", bar_code: "shy05tf8", price: 6.4, image: "avocado.jpg")
# kivi = Product.create(name: "Kivi", bar_code: "shyddrg7", price: 3.2, image: "kivi.jpg")
# peach = Product.create(name: "Peach", bar_code: "s98ddrg7", price: 5.5, image: "peach.jpg")

Discount.create(name: "10% discount", code:"DISC10", percent:0.1)
Discount.create(name: "15% discount", code:"DISC15", percent:0.15)
Discount.create(name: "20% discount", code:"DISC20", percent:0.2)
Discount.create(name: "25% discount", code:"DISC25", percent:0.25)
Discount.create(name: "30% discount", code:"DISC30", percent:0.3)
Discount.create(name: "35% discount", code:"DISC35", percent:0.35)
Discount.create(name: "40% discount", code:"DISC40", percent:0.4)
Discount.create(name: "45% discount", code:"DISC45", percent:0.45)
Discount.create(name: "50% discount", code:"DISC50", percent:0.5)
Discount.create(name: "55% discount", code:"DISC55", percent:0.55)
Discount.create(name: "60% discount", code:"DISC60", percent:0.6)
Discount.create(name: "65% discount", code:"DISC65", percent:0.65)
Discount.create(name: "70% discount", code:"DISC70", percent:0.7)


