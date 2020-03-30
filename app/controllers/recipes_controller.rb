class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recip_params)
    @recipe.save
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def display_recip
    @displayed_recipe = Recipe.where(display_recipe: true)
    if @displayed_recipe.size >= 1
      @displayed_recipe = Recipe.where(display_recipe: true).first
      @displayed_recipe.display_recipe = false
      @displayed_recipe.save
    end
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.display_recipe = true
    @recipe.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    # redirect_to product_path(@product)
  end

  private

  def recip_params
    params.require(:recipe).permit(:name, :description, :capacity, :ingredients, :difficulty, :prep_time, :cook_time, :time, :photo)
  end
end
