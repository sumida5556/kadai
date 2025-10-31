class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  # 🔽 追加！
  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "email", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end
end
