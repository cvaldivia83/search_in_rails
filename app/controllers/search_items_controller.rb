class SearchItemsController < ApplicationController

  def create
    @search_item = SearchItem.new(search_items_params)
  end

  private

  def search_items_params
    params.require(:search_item).permit(:query, :user_ip)
  end
end
