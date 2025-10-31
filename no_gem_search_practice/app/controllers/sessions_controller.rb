class SessionsController < ApplicationController
  def new
  end

  def create
    # ユーザーをメールアドレスで検索
    user = User.find_by(email: params[:email])
    Rails.logger.debug "Sessions#create: user=#{user.inspect}"

    if user.nil?
      flash.now[:alert] = "メールアドレスが見つかりません"
      render :new and return
    end

    # パスワード認証
    if user.authenticate(params[:password])
      # セッションにユーザーIDをセット
      session[:user_id] = user.id
      Rails.logger.debug "Sessions#create: session[:user_id]=#{session[:user_id]}"
      redirect_to cookings_path, notice: "ログインしました"
    else
      flash.now[:alert] = "パスワードが間違っています"
      Rails.logger.debug "Sessions#create: authenticate failed"
      render :new
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました"
  end

  
end
