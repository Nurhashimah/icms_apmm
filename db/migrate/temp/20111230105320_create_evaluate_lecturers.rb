class CreateEvaluateLecturers < ActiveRecord::Migration
  def self.up
    create_table :evaluate_lecturers do |t|
	  t.integer :course_id
      t.integer :subject_id
      t.integer :staff_id
      t.integer :student_id
      t.date    :evaluate_date
      t.string  :comment
      t.integer :ev_obj
      t.integer :ev_knowledge
      t.integer :ev_deliver
      t.integer :ev_content
      t.integer :ev_tool
      t.integer :ev_topic
      t.integer :ev_work
      t.integer :ev_note

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluate_lecturers
  end
end
