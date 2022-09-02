class IngredientsController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredient, except: %i[create new]
  before_action :set_food, only: %i[create new]

  def index
    @ingredients = @recipe.ingredients.includes([:food])
  end

  def create
    @ingredient = @recipe.ingredients.build(ingredient_params, recipe_id: @recipe.id, food_id: @food.id)
    if @ingredient.save
      flash[:success] = 'Ingredient added.'
    else
      flash.now[:error] = 'Error: Failed to save ingredient.'
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit; end

  def update
    if @ingredient.update(ingredient_params)
      flash[:success] = 'Ingredient was successfully updated.'
    else
      render :edit
      flash.now[:error] = 'Failed to modify ingredient.'
    end
  end

  def destroy
    @ingredient.destroy

    redirect_to recipes_url
    flash[:success] = 'Ingredient was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_food
    @food = Food.where(name: params[:food])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:quantity, :recipe_id, :food_id)
  end
end
