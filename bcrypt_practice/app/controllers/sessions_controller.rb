class SessionsController < ApplicationController
  def new
    # ログインフォームを表示
  end

  def create
    # メールアドレスでユーザーを検索
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])  # パスワード認証
      session[:user_id] = @user.id  # ユーザーIDをセッションに保存
      redirect_to user_path(@user)  # ログイン成功後にマイページにリダイレクト
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new  # 認証失敗時に再度ログインフォームを表示
    end
  end

  def destroy
    session[:user_id] = nil  # ログアウト
    redirect_to root_path  # ログアウト後にトップページにリダイレクト
  end
end
