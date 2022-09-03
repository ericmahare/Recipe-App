class PublicRecipesController < ApplicationController
  before_action :set_recipe, except: %i[index]
  def index
    @recipes = Recipe.includes(:recipe_foods, :foods,
                               :user).where(public: true).order(created_at: :desc).map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        description: recipe.description,
        author: recipe.user.name,
        author_id: recipe.user.id,
        created_at: recipe.created_at,
        items: recipe.recipe_foods_count,
        total_price: recipe.foods.map(&:price).sum
      }
    end
  end

  def show; end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      flash[:success] = 'Recipe was successfully deleted.'
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.where(public: true).order(created_at: :DESC).find(params[:id])
  end
end
