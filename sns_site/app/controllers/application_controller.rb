class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # deviseでnameを登録・更新できるように許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :content])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :content])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  # サインイン後の遷移先をマイページに
  def after_sign_in_path_for(resource)
    mypage_path
  end

  # サインアウト後はトップへ
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
