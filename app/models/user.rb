class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  extend OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         # :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :items
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followed_items, through: :reverse_relationships, source: :item

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@nccu.edu.tw/i
  validates_format_of :email, with: VALID_EMAIL_REGEX

  def admin?
    Setting.admin_emails.include?(email)
  end

end
