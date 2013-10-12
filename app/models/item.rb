class Item < ActiveRecord::Base
  mount_uploader :photo, ItemUploader
  attr_accessible :description, :price, :status, :title, :photo, :category_id
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :title, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :category_id, presence: true;

  default_scope -> { order('created_at DESC') }
    
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end 

  def self.category_search(id)
    if id
      where(:category_id => id)
    end
  end 
  
end
