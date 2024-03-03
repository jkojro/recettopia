json.extract! recipe, :id, :title, :cook_time, :prep_time, :ratings, :category, :author, :image

json.recipe_ingredients do
  json.array! recipe.recipe_ingredients do |recipe_ingredient|
    json.partial! 'api/v1/recipe_ingredients/recipe_ingredient', recipe_ingredient: recipe_ingredient
  end
end
