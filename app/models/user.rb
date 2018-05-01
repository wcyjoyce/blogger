class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  # has_many :following, through: :active_relationships

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  # has_many :followers, through: :passive_relationships

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def activity
    activity_feed = []
    following.each do |following|
      following.posts.each do |post|
        activity_feed << {
          user: post.user,
          name: post.user.full_name,
          title: post.title,
          content: post.content,
          created_at: post.created_at,
          all_tags: post.all_tags
        }
      end
    end
    activity_feed.sort_by { |a| a[:created_at] }.reverse!
  end

  def total_comments
    total_comments = []
    posts.each do |post|
      post.comments.each do |comment|
        total_comments << {
          id: comment.id,
          name: comment.name,
          post: comment.post.title,
          comment: comment.comment,
          created_at: comment.created_at
        }
      end
    end
    total_comments.sort_by { |c| c[:created_at] }.reverse!
  end

  def comment_count
    comment_count = 0
    posts.each { |post| comment_count += post.comments.count.to_i }
    comment_count
  end

  def upvote_count
    upvote_count = 0
    posts.each { |post| upvote_count += post.upvotes.count.to_i }
    upvote_count
  end
end
