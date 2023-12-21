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
      description: params[:description],
      supplier_id: params[:supplier_id],
      inventory: params[:inventory]
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
