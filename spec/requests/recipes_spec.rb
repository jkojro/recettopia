require "rails_helper"

RSpec.describe "Api::V1::Recipes", type: :request do
  describe "GET /api/v1/recipes/search" do
    it "responds with http success" do
      get '/api/v1/recipes/search'
      expect(response).to have_http_status(200)
    end
  end
end
