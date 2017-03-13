class AddRestaurantToIngredientAndRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :restaurant_id, :integer
    add_column :ingredients, :restaurant_id, :integer
  end
end
