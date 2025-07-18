class SearchItem < ApplicationRecord
  validates :query, :user_ip, presence: true
  validates :user_ip, format: { with: /(\d{1,3}\.){3}\d{1,3}/, message: "Invalid IP address format"}
end
