class PagesController < ApplicationController
  def home
    @search_items = SearchItem.all 
    @ip = request.remote_ip
    @search_item = SearchItem.new
  end

  def data 
    
  end
end
