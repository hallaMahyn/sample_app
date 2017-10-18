class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order('create_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
