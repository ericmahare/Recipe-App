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

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    flash[:success] = 'Food deleted succesfully'
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
