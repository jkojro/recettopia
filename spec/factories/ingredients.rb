FactoryBot.define do
  factory :ingredient do
    sequence(:name) { |i| "Ingredient#{i}" }
  end
end
