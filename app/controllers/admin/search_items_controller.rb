# app/controllers/admin/search_logs_controller.rb
class Admin::SearchItemsController < ApplicationController
  def index
    @search_items = SearchItem.order(created_at: :desc).limit(30)
  end
end
