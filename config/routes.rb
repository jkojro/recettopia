Rails.application.routes.draw do
  root to: 'api/v1/recipes#search'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'recipes/search', to: 'recipes#search', as: 'recipes_search'
    end
  end
end
