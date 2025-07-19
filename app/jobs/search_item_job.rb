class SearchItemJob < ApplicationJob
  queue_as :default

  def perform(query, user_ip)
    SearchItem.create!(
      query: query,
      user_ip: user_ip
    )
  end
end
