module Api::V1
  class MenuRecipesController < ApplicationController
    before_action :authenticate

    def index
      render json: menu.recipes,
        each_serializer: Api::V1::RecipeSerializer
    end

    def create
      menu.recipes << recipe
      menu.save!
      render json: { :success => true }
    end

    def destroy
      menu.recipes.delete(recipe)
      menu.save!
      render json: { :success => true }
    end

    private
      def menu
        @menu ||= Menu.find_by!(
          restaurant: @current_restaurant,
          id: menu_recipe_params[:menu_id]
        )
      end

      def recipe
        @recipe ||= Recipe.find_by!(
          restaurant: @current_restaurant,
          id: menu_recipe_params[:recipe_id]
        )
      end

      def menu_recipe_params
        params.permit(:menu_id, :recipe_id)
      end
  end
end
