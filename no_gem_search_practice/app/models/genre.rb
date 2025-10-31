class Genre < ApplicationRecord
  has_many :cookings, dependent: :destroy

  validates :genre_name, presence: true
end
