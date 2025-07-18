require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do 
    it "Article is not valid without a title" do 
      article = build(:article, title: nil)
      expect(article).not_to be_valid
    end

    it "Article is not valid without a subtitle" do
      article = build(:article, subtitle: nil)
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
      article = build(:article, :long_title, :long_subtitle)
      expect(article).not_to be_valid
    end

    it "Article's body should not exceed 2_000 characters in length" do 
      article = build(:article, :long_body)
      expect(article).not_to be_valid
    end

    it "Article's body should have at least 800 characters in length" do 
      article = build(:article, :short_body)
      expect(article).not_to be_valid
    end

    it "Article's author should contain at least 2 characters in length" do
      article = build(:article, author: "Y")
      expect(article).not_to be_valid
    end

    it "creates a valid Article with all attributes in correct length" do 
      article = build(:article, :correct_body)
      expect(article).to be_valid
    end

    it "Article is invalid if the category does not have the right value" do 
      article = build(:article, :invalid_category)
      expect(article).not_to be_valid
    end
  end
end

