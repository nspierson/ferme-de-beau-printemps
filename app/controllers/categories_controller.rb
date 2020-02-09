class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)
    @category.save
    redirect_to categories_path
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products.all
  end

  def index
    @categories = Category.all
    @products = Product.all
  end

  private

  def cat_params
    params.require(:category).permit(:name)
  end
end
