FactoryBot.define do
  factory :recipe_ingredient do
    recipe
    ingredient
    sequence(:name) { |i| "#{i} Cups of ingredient#{i}" }
  end
end
