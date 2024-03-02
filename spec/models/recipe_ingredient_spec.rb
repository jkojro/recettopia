require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  subject { build(:recipe_ingredient) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
  
  it { is_expected.to validate_uniqueness_of(:ingredient_id).scoped_to(:recipe_id) }
end
