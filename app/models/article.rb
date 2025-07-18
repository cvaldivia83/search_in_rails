class Article < ApplicationRecord
  validates :title, :author, :body, presence: true
  validates :title, :subtitle, length: { maximum: 80 }
  validates :body, length: { maximum: 20000 }
  validates :author, length: { minimum: 2 }

end
