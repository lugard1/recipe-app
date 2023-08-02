class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.all.where(user: current_user)
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.food.new(food_params)

    if @food.save
      redirect_to @foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
