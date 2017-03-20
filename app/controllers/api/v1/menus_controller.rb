module Api::V1
  class MenusController < ApplicationController
    before_action :authenticate
    before_action :set_menu, only: [:show, :update, :destroy]

    # GET /menus
    def index
      render json: Menu.where(restaurant: @current_restaurant).all
    end

    # GET /menus/1
    def show
      render json: @menu
    end

    # POST /menus
    def create
      @menu = Menu.create(
        title: menu_params[:title],
        restaurant: @current_restaurant
      )

      if @menu.save
        render json: @menu, status: :created
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /menus/1
    def update
      if @menu.update(menu_params)
        render json: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    # DELETE /menus/1
    def destroy
      @menu.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_menu
        @menu = Menu.find_by(restaurant: @current_restaurant, id: params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def menu_params
        params.require(:menu).permit(:id, :title)
      end
  end
end
