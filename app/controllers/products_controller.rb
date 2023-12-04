class ProductsController < ApplicationController
  def everything
    all = Product.all
    render json: {message: all}
  end

  #the first one
  def individual
    first = Product.first
    render json: {message: first}
  end
end
