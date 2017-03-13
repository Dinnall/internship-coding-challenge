module Api::V1
  class MenuSerializer < ActiveModel::Serializer
    attributes :id, :title
  end
end
