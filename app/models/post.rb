class Post < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true  ,on: :update
  validates :price, presence: true
  validates :adress, presence: true
 
  def self.search(search)
    return Post.all unless search
    Post.where(['adress LIKE ?', "%#{search}%"])
  end 
 
end
