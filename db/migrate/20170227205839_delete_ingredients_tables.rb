class DeleteIngredientsTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :ingredients, if_exists: true
    drop_table :recipe_ingredients, if_exists: true
  end
end
