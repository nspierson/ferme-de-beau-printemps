class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def product_of_the_day
    @all_pod = Product.where(pod: true)
    if @all_pod.size >= 1
      @pod = Product.where(pod: true).first
      @pod.pod = false
      @pod.save
    end
    @product = Product.find(params[:product_id])
    @product.pod = true
    @product.save
    respond_to do |format|
      format.html { redirect_to product_path(@product) }
      format.js
    end
    # redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :weight, :stock, :price_cents, :image_url, :show_image_url)
  end
end
