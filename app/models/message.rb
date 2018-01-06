class Message < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :message, presence: true
end
