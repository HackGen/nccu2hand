class Item < ActiveRecord::Base
  mount_uploader :photo, ItemUploader
  attr_accessible :description, :price, :status, :title, :photo
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  default_scope -> { order('created_at DESC') }
end
