class User < ApplicationRecord
  # devise modules - 必要に応じて増やす
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  validates :name, presence: true, uniqueness: true

  # email を必須にしない（Deviseのバリデーションを無効化）
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
