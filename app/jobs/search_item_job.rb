class SearchItemJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SearchItem.create!(
      query: args[0],
      user_ip: args[1]
    )
  end
end

{query: "o que será que será", user_ip: "192.23.346.43"}