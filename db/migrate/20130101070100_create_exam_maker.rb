class CreateExamMaker < ActiveRecord::Migration
  def self.up
    create_table :exammakers do |t|
      t.string   :name
      t.text     :description
      t.integer  :creator_id
      t.integer  :course_id
      t.date     :exam_date
      t.string   :duration_exam
      t.integer  :full_mark
      t.integer  :pass_mark
      t.integer  :intake
      t.integer  :subject_id
      t.timestamps
    end
    
    create_table :exammakers_examquestions, :id => false do |t|
      t.integer  :exammaker_id
      t.integer  :examquestion_id
      t.timestamps
    end
    
    create_table :exammcqanswers do |t|
      t.integer  :examquestion_id
      t.string   :sequence
      t.string   :answer
      t.timestamps
    end

    create_table :examquestions do |t|
      t.integer  :curriculum_id
      t.string   :questiontype
      t.string   :question
      t.text     :answer
      t.decimal  :marks
      t.string   :category
      t.string   :qkeyword
      t.string   :qstatus
      t.integer  :creator_id
      t.date     :createdt
      t.string   :difficulty
      t.text     :statusremark
      t.integer  :editor_id
      t.date     :editdt
      t.integer  :approver_id
      t.date     :approvedt
      t.boolean  :bplreserve
      t.boolean  :bplsent
      t.date     :bplsentdt
      t.string   :diagram_file_name
      t.string   :diagram_content_type
      t.integer  :diagram_file_size
      t.datetime :diagram_updated_at
      t.integer  :topic_id
      t.string   :construct
      t.boolean  :conform_curriculum
      t.boolean  :conform_specification
      t.boolean  :conform_opportunity
      t.boolean  :accuracy_construct
      t.boolean  :accuracy_topic
      t.boolean  :accuracy_component
      t.boolean  :fit_difficulty
      t.boolean  :fit_important
      t.boolean  :fit_fairness
      t.timestamps
    end

    create_table :examsubquestions do |t|
      t.integer  :examquestion_id
      t.integer  :parent_id
      t.string   :sequence
      t.string   :question
      t.string   :classification
      t.integer  :marks
      t.text     :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :exammakers
    drop_table :exammakers_examquestions
    drop_table :exammcqanswers
    drop_table :examquestions
    drop_table :examsubquestions
  end
  
  
end