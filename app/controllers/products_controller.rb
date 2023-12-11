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
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    if @product.valid?
      render template: "products/show"
    else
      render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    #find correct recipe
    @product = Product.find_by(id: params[:id])
    #change attributes
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    if @product.save
      render template: "products/show"
    else
      render json:{error: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    #find recipe
    @product = Product.find_by(id: params[:id])
    #delete recipe
    @product.destroy
    render json: {message: "recipe removed"}
  end
end
