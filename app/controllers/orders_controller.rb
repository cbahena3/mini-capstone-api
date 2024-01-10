class OrdersController < ApplicationController

  def create
    # product = Product.find_by(id: params[:product_id])
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    if current_user
      @order = Order.create(
        user_id: current_user.id,
        subtotal: subtotal,
        tax: tax,
        total: total
      )
      @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      @carted_products.each do |carted_product|
        carted_product.status = 'purchased'
        carted_product.order_id = @order.id
        carted_product.save
      end
      render :show
    else
      render json: {message: "could not process"}
    end
  end

  def show
    @order = Order.find_by(id: params[:id])

    if current_user.id == @order.user_id
      @order = Order.find_by(id: params[:id])
      render :show
    else
      render json: {message: "Please login to view order"}
    end
  end

  def index
    @orders
    if current_user
      @orders = Order.all
      render :index
    else
      render json: {message: "Please login to view order"}
    end
  end

end
