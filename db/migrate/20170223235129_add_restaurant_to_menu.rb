class AddRestaurantToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :restaurant_id, :integer
  end
end
