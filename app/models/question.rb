class Question < ActiveRecord::Base
  attr_accessible :question, :details, :user_id
  has_many :answers
  belongs_to :user
  belongs_to :product
end
