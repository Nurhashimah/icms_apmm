class CreateCourse < ActiveRecord::Migration
  def self.up
    create_table :programmes do |t|
      t.string   :code
      t.string   :name
      t.string   :specialisation
      t.timestamps
    end

    create_table :programmes_subjects, :id => false do |t|
      t.integer :programme_id
      t.integer :subject_id
    end
        
    create_table :courses do |t|
      t.string   :coursecode
      t.string   :name
      t.integer  :parent_id
      t.string   :objective
      t.string   :coursescope
      t.string   :coursedefinition
      t.string   :abbreviation
      t.integer  :staff_id    
      t.timestamps
    end
    
    create_table :courseevaluations do |t|
      t.integer  :student_id
      t.integer  :programme_id
      t.integer  :subject_id     
      t.timestamps
    end
    
    create_table :individu_courses do |t|
      t.integer  :staff_id
      t.string   :course_name
      t.date     :start_course
      t.date     :end_course
      t.string   :loc_course
      t.timestamps
    end
    
    create_table :subjects do |t|
      t.string   :subjectcode
      t.string   :name
      t.integer  :credit
      t.integer  :status
      t.integer  :semester
      t.timestamps
    end
    
    create_table :lesson_plans do |t|
      t.integer  :topic_id
      t.integer  :timing
      t.string   :objective
      t.text     :task
      t.string   :tool
      t.timestamps
    end
    
    create_table :topics do |t|
      t.integer  :subject_id
      t.string   :topic_code
      t.integer  :sequenceno
      t.string   :name
      t.string   :version
      t.string   :objective
      t.text     :content
      t.text     :activity
      t.integer  :creator_id
      t.boolean  :approved
      t.integer  :approvedby_id
      t.date     :approved_date
      t.string   :remarks
      t.string   :checkcode
      t.date     :checkdate
      t.integer  :durahours
      t.integer  :duramins
      t.integer  :duration
      t.string   :organisation
      t.string   :department
      t.date     :date_plan
      t.integer  :class_id
      t.integer  :location_id
      t.text     :learning_outcome
      t.text     :competency
      t.text     :organise_training
      t.text     :material_training
      t.timestamps
    end

    create_table :training_notes do |t|
      t.integer  :timetable_id
      t.string   :title
      t.string   :reference
      t.string   :version
      t.string   :staff_id
      t.date     :release
      t.integer  :topic_id
      t.string   :document_file_name
      t.string   :document_content_type
      t.integer  :document_file_size
      t.datetime :document_updated_at
      t.timestamps
    end

    create_table :trainingreports do |t|
      t.integer  :classtype
      t.integer  :timetable_id
      t.boolean  :location_state
      t.text     :ls_comment
      t.text     :staff_comment
      t.integer  :staff_id
      t.boolean  :submit
      t.text     :tpa_comment
      t.integer  :tpa_id
      t.integer  :topic_id
      t.timestamps
    end
    
  end

  def self.down
    drop_table :programmes
    drop_table :programmes_subjects
    drop_table :courses
    drop_table :courseevaluations
    drop_table :individu_courses
    drop_table :subjects
    drop_table :lesson_plans
    drop_table :topics
    drop_table :training_notes
    drop_table :trainingreports
  end
end