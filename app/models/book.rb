class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title ,presence: true
  validates :body ,presence: true ,length: {maximum: 200}
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
