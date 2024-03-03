require "rails_helper"

RSpec.describe RecipeFinder, type: :service do
  describe "call" do
    let(:ingredient1) { create(:ingredient, name: "flour") }
    let(:ingredient2) { create(:ingredient, name: "sugar") }
    let(:ingredient3) { create(:ingredient, name: "butter") }

    let!(:recipe1) do
      create(
        :recipe, title: "Recipe1", cook_time: 20,
        ingredients: [ingredient1, ingredient2], ratings: 4.0
      )
    end
    let!(:recipe2) do
      create(
        :recipe, title: "Recipe2", cook_time: 15,
        ingredients: [ingredient1], ratings: 4.0
      )
    end
    let!(:recipe3) do
      create(
        :recipe, title: "Recipe3", cook_time: 35, ratings: 4.0,
        ingredients: [ingredient1, ingredient3, ingredient2])
    end
    let(:recipe_params) { { ingredients: ["sugar", "flour", "butter"] } }

    subject { RecipeFinder.new(recipe_params).call }

    it "is returns recipes in order from the most suitable" do
      expect(subject).to eq([recipe3, recipe1, recipe2])
    end

    context "when multiple recipes have same ingredients match" do
      let!(:recipe4) do
        create(
          :recipe, title: "Recipe4", cook_time: 35, ratings: 4.5,
          ingredients: [ingredient1, ingredient3, ingredient2]
        )
      end

      it "orders by ratings" do
        expect(subject).to eq([recipe4, recipe3, recipe1, recipe2])
      end
    end

    context "when cook_time param is given" do
      let(:recipe_params) { { ingredients: ["sugar", "flour", "butter"], cook_time: 20 } }

      it "is filters only recipes in available cook_time in order from the most suitable" do
        expect(subject).to eq([recipe1, recipe2])
      end
    end
  end
end
