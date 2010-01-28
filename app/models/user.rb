class User < ActiveRecord::Base
  # Include default devise modules.
  # Others available are :lockable, :timeoutable and :activatable.
  devise :authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates_presence_of :name
  
  has_many :questions
  has_many :memberships
  has_many :products, :through => :memberships
  has_many :answers
end
