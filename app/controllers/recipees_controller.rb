class RecipeesController < ApplicationController
  before_action :set_recipee, only: %i[show edit update destroy]
  
  def index
    @recipes = Recipee.all
  end

  def show
  end

  def new
    @recipe = Recipee.new
  end

  def edit
  end

  def create
    @recipe = Recipee.new(recipee_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipee_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @recipe.user_id == current_user.id
      @recipe.destroy
      redirect_to recipees_url, notice: 'Recipe was successfully destroyed.'
    else
      redirect_to recipees_url, alert: 'You do not have permission to delete this recipe.'
    end
  end

  private

  def set_recipee
    @recipe = Recipee.find(params[:id])
  end

  def recipee_params
    params.require(:recipee).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
