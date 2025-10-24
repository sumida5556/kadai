class ApplicationController < ActionController::Base
  # Deviseでnameを許可
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ時・アカウント更新時にnameを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    mypage_path
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
