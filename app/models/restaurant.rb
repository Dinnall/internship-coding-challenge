class Restaurant < ApplicationRecord

  has_many :menus
  has_many :recipes
  has_many :ingredients

  before_create do |restaurant|
    restaurant.api_token = restaurant.generate_api_token
  end

  def generate_api_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Restaurant.exists?(api_token: token)
    end
  end
end
