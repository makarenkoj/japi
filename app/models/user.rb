class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
  validates :password, presence: true, length: { minimum: 6, maximum: 6 }
end
