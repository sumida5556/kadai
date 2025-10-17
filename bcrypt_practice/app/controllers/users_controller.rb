class UsersController < ApplicationController
  before_action :require_login, only: [:show]  # ログインしていないとマイページにアクセスできない

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # サインアップ後、ログイン状態にする
      redirect_to user_path(@user)   # ユーザーのマイページにリダイレクト
    else
      render :new  # バリデーションエラーの場合、再度サインアップフォームを表示
    end
  end

  def show
    @user = current_user  # 現在ログインしているユーザー情報を取得
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # ログインしていない場合はトップページにリダイレクト
  def require_login
    redirect_to root_path unless logged_in?
  end
end
