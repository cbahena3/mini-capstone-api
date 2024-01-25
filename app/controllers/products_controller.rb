class ProductsController < ApplicationController
  # before_action :authenticate_admin, except: [:show, :index]


  def index #shows all
    @products = Product.all
    render template: "products/index"
  end

  def show #one at a time
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create

    supplier = Supplier.find_by(name: params[:supplier])
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: supplier.id,
      inventory: params[:inventory]
    )
    if @product.valid?
      params[:images].each do |image|
        Image.create(
          url: "https://static.wikia.nocookie.net/b-dapedia/images/f/f5/Force%3DDragren.jpg/revision/latest?cb=20130830023455",
          product_id: @product.id
        )
      end
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
