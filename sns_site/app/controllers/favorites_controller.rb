class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    favorite = @post.favorites.new(user: current_user)
    if favorite.save
      redirect_back fallback_location: post_path(@post), notice: "お気に入りしました"
    else
      redirect_back fallback_location: post_path(@post), alert: "お気に入りに失敗しました"
    end
  end

  def destroy
    favorite = @post.favorites.find_by(user: current_user)
    if favorite
      favorite.destroy
      redirect_back fallback_location: post_path(@post), notice: "お気に入りを解除しました"
    else
      redirect_back fallback_location: post_path(@post), alert: "お気に入りが見つかりません"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
