class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :item_id

  belongs_to :item
  belongs_to :followed, class_name: "User"

  validates :item_id, presence: true
  validates :followed_id, presence: true
end
