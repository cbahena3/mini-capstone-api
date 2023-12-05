class ProductsController < ApplicationController
  def index #shows all
    @products = Product.all
    render template: "products/index"
  end

  def show #one at a time
    @products = Product.find_by(id: params[:id])
    render template: "products/show"
  end
end
