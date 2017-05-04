class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @microposts = current_user.feed_favorites.order('created_at DESC').page(params[:page])
  end


  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_favorite(micropost)
    flash[:success] = "お気に入りに追加しました"
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.remove_favorite(micropost)
    flash[:success] = "お気に入りを解除しました"
    redirect_to root_url
  end
end

