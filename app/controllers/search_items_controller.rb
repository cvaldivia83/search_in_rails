class SearchItemsController < ApplicationController

  def create
    @ip = request.remote_ip
    @search_item = SearchItem.new(search_items_params)

    respond_to do |format|
      if @search_item.save 
        format.html { redirect_to root_path }
        format.json
      else
        format.html { render root_path, status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def search_items_params
    params.require(:search_item).permit(:query, :user_ip)
  end
end
