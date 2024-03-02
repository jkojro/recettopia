FactoryBot.define do
  factory :recipe do
    sequence(:title) { |i| "Recipe#{i}" }
    instructions { "It's very simple. Just do it!" }
    vegan { false }
    gluten_free { false }
    transient do
      ingredients { [] }
    end

    after(:create) do |recipe, evaluator|
      evaluator.ingredients.each do |ingredient|
        create(:recipe_ingredient, recipe: recipe, ingredient: ingredient)
      end
    end
  end
end
