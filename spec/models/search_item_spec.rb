require 'rails_helper'

RSpec.describe SearchItem, type: :model do
  describe "validations" do 

    it "Search Item is not valid without a user_ip" do 
      search = build(:search_item, user_ip: nil)
      expect(search).not_to be_valid
    end

    it "Search Item is not valid without a query" do 
      search = build(:search_item, query: nil)
      expect(search).not_to be_valid
    end
    it "Search Item is valid with user_ip and query attributes" do 
      search_item = build(:search_item)
      expect(search_item).to be_valid
    end

    it "Search Item has a valid IP address format" do 
      search_item = build(:search_item)
      expect(search_item).to be_valid
    end

    it "Search Item does not have a valid address format" do 
      search_item = build(:search_item, user_ip: "232191175117")
      expect(search_item).not_to be_valid
    end
  end
end
