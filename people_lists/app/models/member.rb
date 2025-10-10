class Member < ApplicationRecord
  validates :name,
            presence: { message: "を入力してください" },
            length: { in: 1..20, message: "は1〜20文字で入力してください" },
            uniqueness: { message: "はすでに存在します" }

  validates :height,
            presence: { message: "を入力してください" },
            numericality: { greater_than_or_equal_to: 1, message: "は1以上の数値を入力してください" }

  validates :weight,
            presence: { message: "を入力してください" },
            numericality: { greater_than_or_equal_to: 1, message: "は1以上の数値を入力してください" }
end
