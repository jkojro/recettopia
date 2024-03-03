class PopulateData
  def initialize(file_path:)
    @file_path = file_path
  end


  def call
    ingredient_pattern = /(?:\d+\s+)?(?:½|¼|¾|⅓|⅔|⅛|⅜|⅝|⅞)?\s*(cups?|teaspoons?|tablespoons?|cans?|ounces?)?\s*(.*)/

    file_content = File.read(file_path)
    data = JSON.parse(file_content)
    recipes = data.map do |recipe_data|
      recipe_record = Recipe.find_or_create_by!(
        title: recipe_data["title"],
        cook_time: recipe_data["cook_time"],
        prep_time: recipe_data["prep_time"],
        ratings: recipe_data["ratings"],
        cuisine: recipe_data["cuisine"],
        category: recipe_data["category"],
        author: recipe_data["author"],
        image: recipe_data["image"]
      )

      recipe_data["ingredients"].each do |ingredient_with_quantity|
        match = ingredient_with_quantity.match(ingredient_pattern)

        ingredient_name = if match && !match[1].nil? # If unit (cup, can, teaspoon etc.) is captured
                            match[2]                 # Exclude quantity and unit
                          else
                            # If no unit, try to remove leading numbers/fractions directly
                            ingredient_with_quantity.sub(/^\d+\s+/, '').sub(/^(½|¼|¾|⅓|⅔|⅛|⅜|⅝|⅞)\s+/, '')
                          end

        ingredient_record = Ingredient.find_or_create_by!(name: ingredient_name.downcase)

        RecipeIngredient.find_or_create_by!(
          recipe_id: recipe_record.id,
          ingredient_id: ingredient_record.id,
          name: ingredient_with_quantity
        )
      end
    end
  end

  private

  attr_reader :file_path
end
