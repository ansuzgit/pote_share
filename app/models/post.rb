class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :adress, presence: true
end
