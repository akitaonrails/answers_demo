class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.text :details
      t.integer :product_id
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :questions
  end
end
