class Removetable < ActiveRecord::Migration
  def self.up
    drop_table :classrooms_students
    drop_table :classrooms
  end

  def self.down
  end
end
