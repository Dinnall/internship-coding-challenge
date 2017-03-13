module Api::V1
  class RecipeSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
  end
end
