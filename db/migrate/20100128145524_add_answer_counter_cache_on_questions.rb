class AddAnswerCounterCacheOnQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :answers_count, :integer, :default => 0
    def Question.readonly_attributes; nil end # A little evil hack
    
    Question.all.each do |question|
      question.answers_count = question.answers.count
      question.save!
    end
  end

  def self.down
    remove_column :questions, :answers_count
  end
end
