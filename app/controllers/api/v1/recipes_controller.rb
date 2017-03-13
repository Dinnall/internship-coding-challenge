module Api::V1
  class RecipesController < ApplicationController
    before_action :authenticate
    before_action :set_recipe, only: [:show, :update, :destroy]

    def index
      render json: Recipe.where(restaurant: @current_restaurant).all
    end

    def show
      render json: @recipe
    end

    # POST /recipes
    def create

      @recipe = Recipe.create(
        name: recipe_params[:name],
        description: recipe_params[:description],
        restaurant: @current_restaurant
      )

      if @recipe.save
        render json: @recipe, status: :created
      else
        render json: @recipe.errors, status: :unprocessable_entity
      end
    end

    def update
      if @recipe.update(recipe_params)
        render json: @recipe
      else
        render json: @recipe.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @recipe.destroy
    end

    private
      def set_recipe
        @recipe = Recipe.where(restaurant: @current_restaurant, id: params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(:id, :name, :description)
      end
  end
end
