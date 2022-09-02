class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      flash[:succes] = 'Recipe food updated successfully'
      redirect_to recipe_path(@recipe_food.recipe)
    else
      flash[:error] = 'Recipe food update failed'
      render :edit
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      redirect_to @recipe
    else
      render :new
    end
  end

   def shopping_list
    foods = Food.includes(:recipes).where(user: current_user)
    # filter food missing for all recipes
    @missing_food = foods.filter { |food| food.recipes.blank? }
    # calculate sum
    @total_price = @missing_food.sum(&:price)
   end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
