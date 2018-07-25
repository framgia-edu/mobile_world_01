class User < ApplicationRecord
  enum role: {customer: 0, staff: 1}

  has_many :receipts, dependent: :destroy
  has_many :payment_methods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :managers
  has_one :cart

  before_save{username.downcase!}
  before_save{email.downcase!}

  VALID_USERNAME_REGEX = /^[a-z0-9_]{6,20}$/
  VALID_NAME_REGEX = /^[a-zA-Z ]{3,50}$/
  VALID_EMAIL_REGEX = /^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/
  VALID_PHONE_NUMBER_REGEX = /^(01[2689]|09)[0-9]{8}$/
  VALID_PASSWORD_REGEX = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/

  validates :username, presence: true,
    format: {with: VALID_USERNAME_REGEX},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true,
    format: {with: VALID_NAME_REGEX}
  validates :address, presence: true
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :phone_number, presence: true,
    format: {with: VALID_PHONE_NUMBER_REGEX}
  has_secure_password
  validates :password, presence: true,
  format: {with: VALID_PASSWORD_REGEX}
end
