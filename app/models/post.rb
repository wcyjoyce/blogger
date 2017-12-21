class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, presence: true

  # Enables photo uploads
  mount_uploader :photo, PhotoUploader
end
