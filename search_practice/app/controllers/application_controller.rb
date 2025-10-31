class ApplicationController < ActionController::Base
  # すでにあるコード
  allow_browser versions: :modern
  stale_when_importmap_changes

  # CSRFを一時的に無効化（開発環境のみ）
  skip_before_action :verify_authenticity_token, if: -> { Rails.env.development? }

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_up_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
