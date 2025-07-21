require 'rails_helper'

RSpec.describe SearchItemJob, type: :job do
  describe "# SearchItem background jobs" do
    it "inserts a background job to a queue" do 
      expect {
        SearchItemJob.perform_later("why is the sky blue?", "192.75.230.81")
      }.to have_enqueued_job(SearchItemJob)
    end
    
    it "checks if background job performs with passed arguments" do 
      expect {
        SearchItemJob.perform_later("learn ruby in 2 weeks", "109.72.801.62")
      }.to have_enqueued_job.with("learn ruby in 2 weeks", "109.72.801.62")
    end

    it "uses a background to create a search_item instance" do 
      expect {
        SearchItemJob.perform_now("Who is Pierre Bourdieu?", "188.09.482.71")
      }.to change(SearchItem, :count).by(1)

      search_item = SearchItem.last
      expect(search_item.query).to eq("Who is Pierre Bourdieu?")
      expect(search_item.user_ip).to eq("188.09.482.71")
    end
  end
end
