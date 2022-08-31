class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end
  def new 
    @food = Food.new
  end
  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:success] = 'Food created succesfully'
      redirect_to foods_path
    else
      render 'new'
    end
  end
  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
