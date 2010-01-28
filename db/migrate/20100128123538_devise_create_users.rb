class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :name, :null => false
      t.authenticatable :encryptor => :sha1, :null => false
      t.rememberable
      t.trackable
      # t.lockable

      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end

  def self.down
    drop_table :users
  end
end
