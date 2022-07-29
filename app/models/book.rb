class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  validates :title ,presence: true
  validates :tag ,presence: true
  validates :body ,presence: true ,length: {maximum: 200}
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  scope :day, -> {order(created_at: :desc)}
  scope :star, ->{order(star: :desc)}
end
