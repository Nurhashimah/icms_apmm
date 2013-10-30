class Classroomstudentjoin < ActiveRecord::Migration
  def self.up
    create_table :classrooms_students, :id => false do |t|
        t.integer :classroom_id
        t.integer :student_id
     #   t.integer :programme_id
    end
  end

  def self.down
  end
end
