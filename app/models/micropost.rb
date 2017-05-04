class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :favorites_user, through: :favorites, source: :micropost
  
  def feed_favorites
    Micropost.where(id: favorites_user_ids)
  end
end
