class User < ApplicationRecord
  # Deviseのモジュールを読み込み
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
