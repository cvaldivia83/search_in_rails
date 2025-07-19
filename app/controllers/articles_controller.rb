class ArticlesController < ApplicationController

  def index
    @user_ip = request.remote_ip
    @articles = Article.all
    
    if params[:query].present?
      @articles = @articles.search_articles(params[:query])
    end

    respond_to do |format|
      format.html 
      format.text { render partial: 'articles/list', formats: :html, locals: { articles: @articles } }
    end 
  end
end
