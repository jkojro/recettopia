class RecipeFinder
  def initialize(params)
    @ingredients = params[:ingredients]&.map(&:downcase)
    @cook_time = params[:cook_time]
  end

  RECIPES_LIMIT = 10

  def call
    recipes = Recipe.joins(:ingredients).
      where(ingredients: { name: ingredients }).
      group('recipes.id').
      order('COUNT(ingredients.id) DESC, ratings DESC')

    recipes = recipes.where('cook_time <= ?', cook_time) if cook_time.present?

    recipes.limit(RECIPES_LIMIT)
  end

  private

  attr_reader :ingredients, :cook_time
end
