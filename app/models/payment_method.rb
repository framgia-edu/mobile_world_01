class PaymentMethod < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :expire_date, presence: true
end
