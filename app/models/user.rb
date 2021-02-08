class User < ApplicationRecord
  has_many :posts , dependent: :destroy
  has_many :reservations ,dependent: :destroy
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true,allow_nil: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true,
                    allow_nil: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },allow_nil: true
  mount_uploader :image, ImageUploader 
  validates :image, presence: true, on: :profile_edit
  validates :introduction, presence: true , on: :profile_edit
  
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  #渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
    #ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
end