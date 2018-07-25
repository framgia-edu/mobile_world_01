class Comment < ApplicationRecord
  belongs_to :user, :product

  validates :content, presence: true
end
