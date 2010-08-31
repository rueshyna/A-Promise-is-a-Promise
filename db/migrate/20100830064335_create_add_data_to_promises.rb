class CreateAddDataToPromises < ActiveRecord::Migration
  def self.up
    add_column :promises, :title, :string
    add_column :promises, :start, :string
    add_column :promises, :end, :string
    add_column :promises, :allDay, :boolean
  end

  def self.down
    remove_column :promises, :title
    remove_column :promises, :start
    remove_column :promises, :allDay
    add_column :promises, :allDay
  end
end
