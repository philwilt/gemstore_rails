class ProductsController < ApplicationController
  def index
    products = Product.all
    products = products.where(price: params[:price]) if params[:price]
    render json: products, status: :ok
  end

  def show
  end

end
