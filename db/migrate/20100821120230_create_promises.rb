class CreatePromises < ActiveRecord::Migration
  def self.up
    create_table :promises do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :when
      t.integer :howlong
      t.boolean :check

      t.timestamps
    end
  end

  def self.down
    drop_table :promises
  end
end
