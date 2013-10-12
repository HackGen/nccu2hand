class Item < ActiveRecord::Base
  mount_uploader :photo, ItemUploader
  attr_accessible :description, :price, :status, :title, :photo, :category_id
  belongs_to :user
  belongs_to :category
  has_many :relationships, foreign_key: "item_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  validates :user_id, presence: true
  validates :title, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :category_id, presence: true;

  default_scope -> { order('created_at DESC') }

  def is_being_followed_by?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow_by!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow_by!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end
