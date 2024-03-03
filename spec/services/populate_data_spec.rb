require 'rails_helper'

RSpec.describe PopulateData do
  subject { PopulateData.new(file_path:).call }
  let(:file_path) { Rails.root.join('spec', 'fixtures', 'populate_data_test_set.json') }

  describe '#call' do
    it 'creates recipes and ingredients from file' do
      expect { subject }.to change { Recipe.count }.by(1)
                        .and change { Ingredient.count }.by(5)
                        .and change { RecipeIngredient.count }.by(5)

      recipe = Recipe.last
      expect(recipe.title).to eq("Golden Sweet Cornbread")
      expect(recipe.ingredients.count).to eq(5)

      expect(Ingredient.pluck(:name)).to include(
        'yellow cornmeal', 'white sugar', 'salt', 'baking powder', 'egg'
      )

      expect(RecipeIngredient.pluck(:name)).to include(
        "1 cup yellow cornmeal", "⅔ cup white sugar",
        "1 teaspoon salt", "3 ½ teaspoons baking powder", "1 egg"
      )
    end
  end
end
