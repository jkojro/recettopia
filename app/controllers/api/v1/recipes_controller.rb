class Api::V1::RecipesController < ActionController::API
  def search
    @recipes = [Recipe.first, Recipe.second]
  end
end
