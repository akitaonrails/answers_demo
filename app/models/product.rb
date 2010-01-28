class Product < ActiveRecord::Base
  has_many :questions
  has_many :memberships
  has_many :users, :through => :memberships
end
