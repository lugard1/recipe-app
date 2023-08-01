class FoodsController < ApplicationController
    before_action :set_food, only: [:show, :edit,  :destroy]
  
    def index
      @foods = Food.all.where(user_id: current_user.id)
    end
  
    def show
    end
  
    def new
      @food = Food.new
    end
  
    def create
      @food = current_user.foods.new(food_params)
  
      if @food.save
        redirect_to @foods_path, notice: 'Food was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    
    def destroy
      @food.destroy
      redirect_to foods_path, notice: 'Food was successfully destroyed.'
    end
  
    private
  
    def set_food
      @food = Food.find(params[:id])
    end
  
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price)
    end
  end