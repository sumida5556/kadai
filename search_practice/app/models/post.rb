class Post < ApplicationRecord
  belongs_to :user

  # 🔽 これを追加！
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "content", "created_at", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
