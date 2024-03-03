FactoryBot.define do
  factory :recipe do
    sequence(:title) { |i| "Recipe#{i}" }
    cook_time { 30 }
    prep_time { 10 }
    ratings { 4.45 }
    category { "Bread" }
    author { "Cheff" }

    transient do
      ingredients { [] }
    end

    after(:create) do |recipe, evaluator|
      evaluator.ingredients.each do |ingredient|
        create(
          :recipe_ingredient,
          recipe: recipe,
          ingredient: ingredient,
          name: "2 Cups of #{ingredient.name}"
        )
      end
    end
  end
end
