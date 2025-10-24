class MypageController < ApplicationController
  before_action :authenticate_user!  # ログインしていないとアクセス不可

  def show
    @user = current_user
  end
end
