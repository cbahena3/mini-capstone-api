# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


product = Product.new(
  name: "Dumbbell",
  price: 50,
  image_url:"https://www.ritfitsports.com/cdn/shop/products/ritfit-rubber-hex-dumbbell-set-10-60-lbs-weight-ritfit-613242.jpg?v=1669948018",
  description:"Rubber hex dumbbells feature an ergonomically designed chrome handle—tapering at two ends—to enhance a power grip. The knurled handle surface provides solid contact with your hands, and you shall find it easy to fasten onto the hex dumbbells at any weight and under sweat."
)

product.save
