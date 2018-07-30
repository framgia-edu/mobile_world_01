class Receipt < ApplicationRecord
  belongs_to :user
  has_one :cart, dependent: :destroy

  validates :total_price, presence: true
  validates :transaction_time, presence: true
  validates :payment_method, presence: true
end
