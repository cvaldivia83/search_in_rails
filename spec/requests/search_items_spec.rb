require 'rails_helper'

RSpec.describe "SearchItems", type: :request do
  describe "POST #create" do
    it "creates a search item" do
      expect {
        post 'search_items', params: { query: 'Why is the sky blue?', user_ip: "99.149.108.239" }.to_change(SearchItem, :count).by(1)
      }
    end
  end
end
