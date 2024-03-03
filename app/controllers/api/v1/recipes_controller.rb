class Api::V1::RecipesController < ActionController::API
  def search
    @recipes = [
      Recipe.create(
        title: "Test", cook_time: 30, prep_time: 10,
        ratings: 4.45, category: "Bread", author: "Cheff",
        image: "https://assets.afcdn.com/recipe/20150901/17089_w420h344c1cx1500cy2250.jpg"
      )
    ]
  end
end
