class Removetableclassroom < ActiveRecord::Migration
  def self.up
  drop_table :classrooms
  drop_table :classrooms_students
  end

  def self.down
  end
end
