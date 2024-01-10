class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render :index
  end

  def create
    @carted_product = CartedProduct.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    status: 'carted'
    )
    if @carted_product.save
      render :show
    else
      render json: {error: @carted_product.errors.full_message}, status: :unprocessable_entity
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render json: {message: "item removed from cart"}
  end
end
