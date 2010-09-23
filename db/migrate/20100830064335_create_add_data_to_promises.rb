class CreateAddDataToPromises < ActiveRecord::Migration
  def self.up
    add_column :promises, :title, :string
    add_column :promises, :start, :string
    add_column :promises, :end, :string
    add_column :promises, :allDay, :boolean
    add_column :promises, :className, :string
  end

  def self.down
    remove_column :promises, :title
    remove_column :promises, :start
    remove_column :promises, :end
    remove_column :promises, :allDay
    remove_column :promises, :className
  end
end
