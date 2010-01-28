class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates_presence_of :user, :product
end
