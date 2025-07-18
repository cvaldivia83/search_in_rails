require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do 
    it "creates an instance of Article with valid attributes" do
      article = build(:article)
      expect(article).to be_valid
    end
    
    it "Article is not valid without a title" do 
      article = build(:article, title: nil)
      expect(article).not_to be_valid
    end

    it "Article is not valid without an author" do
      article = build(:article, author: nil)
      expect(article).not_to be_valid
    end

    it "Article is not valid without a body" do 
      article = build(:article, body: nil)
      expect(article).not_to be_valid
    end

    it "Article's title and subtitle should not exceed 90 characters length" do
      article = build(:article, title: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut cum culpa perferendis qui exercitationem', subtitle: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut cum culpa perferendis qui exercitationem')
      expect(article).not_to be_valid
    end

    it "Article's body should not exceed 1_500 characters in length" do 
      article = build(:article)
      expect(article).not_to be_valid
    end

    it "Article's author should contain at least 2 characters in length" do
      article = build(:article, author: "Y")
      expect(article).not_to be_valid
    end

  end
end

