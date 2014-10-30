class ProductsController < ApplicationController
  def index
    products = Product.all
    products = products.where(price: params[:price]) if params[:price]
    render json: products, status: :ok
  end

  def show
    @product = Product.find(params[:id])
    render json: @product, status: :ok
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 201, location: product
    else
      render json: product.errors, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!
    render nothing: true, status: 204
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
