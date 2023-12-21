# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# product = Product.new(
#   name: "Dumbbell",
#   price: 50,
#   image_url:"https://www.ritfitsports.com/cdn/shop/products/ritfit-rubber-hex-dumbbell-set-10-60-lbs-weight-ritfit-613242.jpg?v=1669948018",
#   description:"Rubber hex dumbbells feature an ergonomically designed chrome handle—tapering at two ends—to enhance a power grip. The knurled handle surface provides solid contact with your hands, and you shall find it easy to fasten onto the hex dumbbells at any weight and under sweat."
# )

# product.save

# supplier = Supplier.create(
#   name: "Rogue Fitness",
#   email: "rogue@fitness.com",
#   phone_number: "800-888-7777"
# )

# supplier = Supplier.create(
#   name: "Raw Gear",
#   email: "raw@gear.com",
#   phone_number: "800-111-2222"
# )

# supplier = Supplier.create(
#   name: "Bum Fitness",
#   email: "bum@fitness.com",
#   phone_number: "800-333-4444"
# )

image = Image.create(
  url: "https://images.squarespace-cdn.com/content/v1/57d62869f7e0ab316f51daf8/1619560376175-FUBEMQ2EVU91OCUZ2GV8/all+done",
  product_id: 1
)

image = Image.create(
  url: "https://i5.walmartimages.com/asr/6c6c1246-8caa-4421-974c-52ca65705cf3.f5d65f1974adbed98f3db0b616d6b16a.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
  product_id: 1
)
