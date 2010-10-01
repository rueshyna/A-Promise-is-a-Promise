class CreatePromises < ActiveRecord::Migration
  def self.up
    create_table :promises do |t|
      t.integer :user_id
      t.string :when
      t.integer :howlong
      t.string :score
      t.string :happen
      t.string :improvement
      t.string :evaluation

      t.timestamps
    end
  end

  def self.down
    drop_table :promises
  end
end
