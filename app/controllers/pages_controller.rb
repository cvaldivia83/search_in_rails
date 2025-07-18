class PagesController < ApplicationController
  def home
    @search_items = SearchItem.all 
    @ip = request.remote_ip
  end

  def data 
    
  end
end
