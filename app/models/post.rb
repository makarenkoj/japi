class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
  validates :categories, presence: true, length: { maximum: 25 }
end
