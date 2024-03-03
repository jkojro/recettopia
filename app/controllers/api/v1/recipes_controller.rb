class Api::V1::RecipesController < ActionController::API
  def search
    @recipes = ::RecipeFinder.new(recipe_params).call
end

private

  def recipe_params
    params.permit(:cook_time, ingredients: [])
  end
end
