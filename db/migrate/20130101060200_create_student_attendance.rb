class CreateStudentAttendance < ActiveRecord::Migration
  def self.up
    create_table :studentattendances do |t|
      t.integer  :timetable_id
      t.integer  :student_id
      t.boolean  :attend
      t.integer  :programme_id
      t.date     :date_attendance
      t.integer  :topic_id
      t.timestamps
    end
    
    create_table :studentattendances_students, :id => false do |t|
      t.integer :studentattendance_id
      t.integer :student_id
    end
  end

  def self.down
    drop_table :studentattendances
    drop_table :studentattendances_students
  end
end