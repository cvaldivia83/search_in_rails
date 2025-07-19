class SearchItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @user_ip = request.remote_ip
    SearchItemJob.perform_later(params[:query], @user_ip)
    head :ok
  end
end
