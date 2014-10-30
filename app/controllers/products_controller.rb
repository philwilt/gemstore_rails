class ProductsController < ApplicationController
  def index
    products = Product.all
    products = products.where(price: params[:price]) if params[:price]
    render json: products, status: :ok
  end

  def show
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 201, location: product
    else

    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
