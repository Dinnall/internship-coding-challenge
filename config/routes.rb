Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :menus do
        resources :recipes,
          controller: 'menu_recipes',
          only: [:index, :create, :destroy],
          param: :recipe_id
      end
      resources :recipes
    end
  end
  get "" => redirect("https://github.com/plated/internship-coding-challenge")
end
