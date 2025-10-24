class HomeController < ApplicationController
  def index
    # トップは投稿一覧のサマリなどを表示する例
    @posts = Post.includes(:user).order(created_at: :desc).limit(10)
  end
end
