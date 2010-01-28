class Answer < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
  belongs_to :user
end
