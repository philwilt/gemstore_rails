class CategoriesController < ApplicationController
  def index
    render json: Category.all, status: 200
  end

  def show
    @category = Category.find(params[:id])
    render json: @category, status: 200
  end
end
