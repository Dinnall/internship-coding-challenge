module Api::V1
  class RestaurantSerializer < ActiveModel::Serializer
    attributes :id, :name, :api_token
  end
end
