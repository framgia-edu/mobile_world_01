class Receipt < ApplicationRecord
  belongs_to :user
  has_one :cart, dependent: :destroy

  validates :total_price, present: true
  validates :transaction_time, present: true
  validates :paymemt_method, present: true
end
