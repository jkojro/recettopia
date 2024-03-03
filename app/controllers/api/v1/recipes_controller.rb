class Api::V1::RecipesController < ActionController::API
  def search
    @recipes = [Recipe.find(20)]
  end
end
