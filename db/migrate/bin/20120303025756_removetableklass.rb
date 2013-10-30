class Removetableklass < ActiveRecord::Migration
  def self.up
  drop_table :klasses
  drop_table :klasses_students
  end

  def self.down
  end
end
