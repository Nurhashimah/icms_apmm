class CreateScheduling < ActiveRecord::Migration
  def self.up
    create_table :intakes do |t|
      t.string   :name
      t.integer  :intake_no
      t.date     :year
      t.boolean  :active
      t.timestamps
    end
    
    create_table :klasses do |t|
      t.string   :name
      t.integer  :intake_id
      t.integer  :programme_id
      t.integer  :subject_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :klasses_students, :id => false do |t|
      t.integer :klass_id
      t.integer :student_id
    end
    
    create_table :period_timings do |t|
      t.string   :name
      t.time     :start_time
      t.time     :end_time
      t.boolean  :break
      t.integer  :intake_id
      t.timestamps
    end
    
    create_table :time_table_entries do |t|
      t.integer  :intake_id
      t.integer  :programme_id
      t.integer  :subject_id
      t.integer  :topic_id
      t.integer  :klass_id
      t.integer  :tt_wd
      t.date     :timetable_date
      t.integer  :staff_id
      t.integer  :residence_id
      t.integer  :timing_id
      t.timestamps
    end

    create_table :timetable_week_days do |t|
      t.string   :name
      t.timestamps
    end

    create_table :timetables do |t|
      t.integer  :classroom_id
      t.integer  :topic_id
      t.integer  :location_id
      t.integer  :staff_id
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
    
  end

  def self.down
    drop_table :klasses
    drop_table :klasses_students
    drop_table :intakes
    drop_table :period_timings
    drop_table :time_table_entries
    drop_table :timetable_week_days
    drop_table :timetables
  end
end