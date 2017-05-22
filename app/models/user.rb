class User < ApplicationRecord
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_many :messages
    has_many :posts
    has_many :owners
    has_many :blogs, through: :owners
    # tricky one - blogs posted on by a user
    has_many :blog_posts, through: :posts, source: :blog
    validates :first_name, :last_name, presence: true, length: {minimum: 2}
    validates :email_address, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
end
