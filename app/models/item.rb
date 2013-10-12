class Item < ActiveRecord::Base
  attr_accessible :desciption, :title
  belongs_to :user
end
