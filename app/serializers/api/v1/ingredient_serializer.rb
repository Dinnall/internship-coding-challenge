module Api::V1
  class IngredientSerializer < ActiveModel::Serializer
    attributes :id, :title
  end
end
