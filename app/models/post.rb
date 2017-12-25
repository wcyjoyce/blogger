class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true

  # Enables photo uploads
  mount_uploader :photo, PhotoUploader
end
