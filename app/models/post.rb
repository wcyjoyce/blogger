class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, :content, presence: true

  # Enables photo uploads
  mount_uploader :photo, PhotoUploader

  # Post tags
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    # self.tags.map(&:name)
    self.tags.map(&:name).join(", ")
  end

  # Tag-based searches
  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
