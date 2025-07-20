require 'rails_helper'
require 'faker'

RSpec.describe "Articles Controller", type: :request do
  describe "GET /index" do
    it "renders the correct template for root path" do 
      get root_path
      expect(response).to render_template(:index)
    end

    it "fetches all articles from DB and assigns it to @articles" do
      article1 = create(:article, :correct_body)
      get root_path
      expect(assigns(:articles)).to match_array([article1])
    end
  end

  describe "GET /articles?query=john" do 
    
    let!(:matching_article) { create(:article, title: Faker::Book.title, subtitle: Faker::Lorem.sentence(word_count: 4), author: 'John Smith', body: Faker::Lorem.characters(number: 810)) }
    let!(:non_matching_article) { create(:article, title: Faker::Book.title, subtitle: Faker::Lorem.sentence(word_count: 4), author: 'Emmanuel Du Pont', body: Faker::Lorem.characters(number: 910)) }

    it "performs a search through all articles and returns articles that match params[:query]" do 
      get root_path, params: { query: 'john' }

      expect(response.body).to include("John Smith")
      expect(response.body).not_to include("Emmanuel du Pont")
      expect(response).to have_http_status(:ok)
    end
  end
end
