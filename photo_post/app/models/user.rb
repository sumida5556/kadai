class User < ApplicationRecord
  # Devise関連
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 20 }
end
