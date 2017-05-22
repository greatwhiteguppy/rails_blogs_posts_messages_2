class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :author, :message, presence: true
  validates :author, length: {minimum: 2}
  validates :message, length: {minimum: 5}
end
