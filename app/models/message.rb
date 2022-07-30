class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :body,length: { in: 1..140 } 
end
