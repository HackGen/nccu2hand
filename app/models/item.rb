class Item < ActiveRecord::Base
  attr_accessible :description, :price, :status, :title
end
