require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  subject { build(:recipe_ingredient) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end
