class AddUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :student_id, :unique =>true
  end

  def self.down
    remove_index :users, :student_id
  end
end
