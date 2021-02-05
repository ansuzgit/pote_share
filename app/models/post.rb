class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  #validates :image, presence: true ,on :update
  validates :price, presence: true
  validates :adress, presence: true
end
