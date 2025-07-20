class ArticlesController < ApplicationController

  def index
    @user_ip = request.remote_ip
    @articles = Article.all
    
    if params[:query].present?
      # @articles = @articles.search_articles(params[:query])
      @articles = search_results(params[:query])
    end

    respond_to do |format|
      format.html 
      format.text { render partial: 'articles/list', formats: :html, locals: { articles: @articles } }
    end 
  end

  def search_results(query)
    Rails.cache.fetch("search:#{query.downcase.strip}", expires_in: 15.minutes) do
      # Test if cache is working 
      Rails.logger.debug "Cache MISS for query: #{query}"
      Article.search_articles(query).to_a 
    end 
  end
end
