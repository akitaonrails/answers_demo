class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name

      t.timestamps
    end
    
    Product.create :name => "Basecamp"
    Product.create :name => "Campfire"
    Product.create :name => "Highrise"
    Product.create :name => "Backpack"
  end

  def self.down
    drop_table :products
  end
end
