class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :user_id
      t.string :group

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
