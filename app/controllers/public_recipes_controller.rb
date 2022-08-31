class PublicRecipesController < ApplicationController
  before_action :set_recipe, except: %i[index]
  def index
    @recipes = Recipe.where(public: true).includes([:user]).order(created_at: :DESC)
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
