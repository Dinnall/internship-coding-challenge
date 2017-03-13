class Recipe < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_recipes
  has_many :menus, through: :menu_recipes
end
