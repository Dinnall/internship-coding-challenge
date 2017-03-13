class AddIndexToApiKey < ActiveRecord::Migration[5.0]
  def change
    add_index :restaurants, :api_token
    add_index :menus, :restaurant_id
    add_index :recipes, :restaurant_id
    add_index :menu_recipes, [:menu_id, :recipe_id], unique: true
  end
end
