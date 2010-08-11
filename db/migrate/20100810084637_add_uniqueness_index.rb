class AddUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :school_id, :unique =>true
  end

  def self.down
    remove_index :users, :school_id 
  end
end
