require "rails_helper"

RSpec.describe "Api::V1::Recipes", type: :request do
  describe "GET /api/v1/recipes/search" do
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    let(:ingredient1) { create(:ingredient, name: "sugar") }
    let(:ingredient2) { create(:ingredient, name: "milk") }
    let(:ingredient3) { create(:ingredient, name: "pasta") }

    let!(:recipe1) { create(:recipe, ingredients: [ingredient1, ingredient2]) }
    let!(:recipe2) { create(:recipe, ingredients: [ingredient3]) }

    let(:recipe_ingredient1) { ingredient1.recipe_ingredients.first }
    let(:recipe_ingredient2) { ingredient2.recipe_ingredients.first }
    let(:recipe_ingredient3) { ingredient3.recipe_ingredients.first }

    it "responds with http success" do
      get '/api/v1/recipes/search'
      expect(response).to have_http_status(200)
    end

    it "responds with list of recipes and it's recipe_ingredients" do
      get '/api/v1/recipes/search', params: { ingredients: %w(sugar pasta) }

      expect(json_response).to eq(
        [
          {
            id:                 recipe1.id,
            title:              recipe1.title,
            cook_time:          recipe1.cook_time,
            prep_time:          recipe1.prep_time,
            ratings:            recipe1.ratings,
            category:           recipe1.category,
            author:             recipe1.author,
            image:              recipe1.image,
            recipe_ingredients: [
              {
                id:   recipe_ingredient1.id,
                name: recipe_ingredient1.name
              },
              {
                id:   recipe_ingredient2.id,
                name: recipe_ingredient2.name
              }
            ]
          },
          {
            id:                 recipe2.id,
            title:              recipe2.title,
            cook_time:          recipe2.cook_time,
            prep_time:          recipe2.prep_time,
            ratings:            recipe2.ratings,
            category:           recipe2.category,
            author:             recipe2.author,
            image:              recipe2.image,
            recipe_ingredients: [
              {
                id:   recipe_ingredient3.id,
                name: recipe_ingredient3.name
              }
            ]
          }
        ]
      )
    end
  end
end
