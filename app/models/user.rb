class User < ApplicationRecord
  enum role: {customer: 0, staff: 1}

  attr_reader :remember_token

  has_many :receipts, dependent: :destroy
  has_many :payment_methods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :managers
  has_one :cart

  before_save{username.downcase!}
  before_save{email.downcase!}

  VALID_USERNAME_REGEX = /\A[a-z0-9_]{6,20}\z/
  VALID_NAME_REGEX = /\A[a-zA-Z. ]{3,50}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\A(01[2689]|09|08)[0-9]{8}\z/
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/

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
  validates :password, presence: true,
    format: {with: VALID_PASSWORD_REGEX}, allow_nil: true
  has_secure_password

  def remember
    @remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def current_user? user
    user == self
  end

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
