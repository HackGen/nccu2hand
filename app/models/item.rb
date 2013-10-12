class Item < ActiveRecord::Base
  attr_accessible :description, :price, :status, :title
  belongs_to :user

  validates :user_id, presence: true
end
