class Blog < ApplicationRecord
    has_many :posts
    has_many :owners
    has_many :users, through: :owners
    has_many :comments, as: :commentable
    # tricky one - many users posting on one blog
    has_many :user_posts, through: :posts, source: :user
    validates :name, :description, presence: true
    validates :name, length: {minimum: 2}
    validates :description, length: {minimum: 5}
end
