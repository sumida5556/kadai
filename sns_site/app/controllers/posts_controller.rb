class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(10) rescue Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    redirect_to posts_path, alert: "権限がありません" unless @post.user == current_user
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿を作成しました"
    else
      render :new
    end
  end

  def update
    if @post.user != current_user
      redirect_to posts_path, alert: "権限がありません"
      return
    end

    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: "投稿を削除しました"
    else
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :comment)
  end
end
