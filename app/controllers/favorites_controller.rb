class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success]="投稿にいいね！しました。"
    redirect_to likes_user_path(current_user)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success]="投稿へのいいね！を取り消しました。"
    redirect_to likes_user_path(current_user)
  end
end
