class ProductsController < ApplicationController
  def index #shows all
    @products = Product.all
    render template: "products/index"
  end

  def show #one at a time
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: "Lat Pull-Down",
      price: 499,
      image_url: "https://www.bellsofsteel.us/wp-content/uploads/2022/10/lat-pulldown-9.webp",
      description: "Perform lat pulldowns, low rows, curls & more (up to 310 pounds) with this 2-in-1 machine!"
    )
    @product.save
    render template: "products/show"
  end
end
