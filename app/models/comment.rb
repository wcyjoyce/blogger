class Comment < ApplicationRecord
  belongs_to :post
  validates :name, :comment, presence: true

  def time
    created_at.strftime("%B %e, %Y")
  end
end
