class Article < ApplicationRecord
  validates :title, :subtitle, :author, :body, presence: true
  validates :title, :subtitle, :body, uniqueness: true
  validates :category, inclusion: { in: %w(tech career challenge tutorial hackathon), message: "This is not a valid category."}
  validates :title, :subtitle, length: { maximum: 80 }
  validates :body, length: { maximum: 2000, minimum: 800 }
  validates :author, length: { minimum: 2 }
end
