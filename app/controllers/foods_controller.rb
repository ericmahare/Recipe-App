class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  # before_action :set_user
  before_action :authenticate_user!

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash[:success] = 'Food created succesfully'
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    flash[:success] = 'Food deleted succesfully'
    redirect_to foods_path
  end

  def set_food
    @recipe = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
