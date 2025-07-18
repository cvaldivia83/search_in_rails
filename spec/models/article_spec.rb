require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do 
    it "creates an instance of Article with valid attributes" do
      article = build(:article)
      expect(article).to be_valid
    end
    
    it "is not valid without a title" do 
      article = build(:article, title: nil)
      expect(article).not_to be_valid
    end

    it "is not valid without an author" do
      article = build(:article, author: nil)
      expect(article).not_to _be_valid
    end

    it "is not valid without a body" do 
      article = build(:article, body: nil)
      expect(article).not_to be_valid
    end
  end
end
