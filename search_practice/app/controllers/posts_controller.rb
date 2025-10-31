class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿しました。'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
