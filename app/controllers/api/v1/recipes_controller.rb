class Api::V1::RecipesController < ActionController::API
  def search
    @recipes = [Recipe.create(title: "Test")]
  end
end
