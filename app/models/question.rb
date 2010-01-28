class Question < ActiveRecord::Base
  attr_accessible :question, :details, :user_id, :tag_list
  has_many :answers
  belongs_to :user
  belongs_to :product
  
  acts_as_taggable_on :tags
  
  def answered?
    answers_count > 0
  end
end
