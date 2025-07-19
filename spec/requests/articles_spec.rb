require 'rails_helper'

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

    it "searches for the correct Article" do
      # article = create(:article, :correct_body)
      
      # get root_path, params: { query: "lorem ipsum" }
    end
  end
end
