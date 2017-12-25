class Comment < ApplicationRecord
  belongs_to :posts
  validates :name, :comment, presence: true
end
