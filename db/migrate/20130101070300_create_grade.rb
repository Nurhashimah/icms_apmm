class CreateGrade < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.integer  :type_id
      t.string   :description
      t.decimal  :marks
      t.decimal  :weightage
      t.decimal  :score
      t.decimal  :completion
      t.boolean  :formative
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :grade_id
      t.timestamps
    end
    
    create_table :grades do |t|
      t.integer  :student_id
      t.integer  :subject_id
      t.boolean  :sent_to_KM
      t.date     :sent_date
      t.decimal  :formative
      t.decimal  :score
      t.boolean  :eligible_for_exam
      t.boolean  :carry_paper
      t.decimal  :summative
      t.boolean  :resit
      t.decimal  :finalscore
      t.integer  :grading_id
      t.string   :exam1name
      t.string   :exam1desc
      t.decimal  :exam1marks
      t.string   :exam2name
      t.string   :exam2desc
      t.decimal  :exam2marks
      t.decimal  :examweight
      t.string   :type
      t.string   :description
      t.integer  :mark
      t.integer  :totalmark
      t.string   :typetest
      t.timestamps
    end
    
    create_table :marks do |t|
      t.decimal  :mark
      t.integer  :analysispaperexam_id
      t.timestamps
    end
    
    create_table :student_marks do |t|
      t.integer  :analysis_grade_id
      t.integer  :student_id
      t.integer  :m_1
      t.integer  :m_2
      t.integer  :m_3
      t.integer  :m_4
      t.integer  :m_5
      t.integer  :m_6
      t.integer  :m_7
      t.integer  :m_8
      t.integer  :m_9
      t.integer  :m_10
      t.integer  :m_11
      t.integer  :m_12
      t.integer  :m_13
      t.integer  :m_14
      t.integer  :m_15
      t.integer  :m_16
      t.integer  :m_17
      t.integer  :m_18
      t.integer  :m_19
      t.integer  :m_20
      t.integer  :m_21
      t.integer  :m_22
      t.integer  :m_23
      t.integer  :m_24
      t.integer  :m_25
      t.integer  :m_26
      t.integer  :m_27
      t.integer  :m_28
      t.integer  :m_29
      t.integer  :m_30
      t.integer  :m_31
      t.integer  :m_32
      t.integer  :m_33
      t.integer  :m_34
      t.integer  :m_35
      t.integer  :m_36
      t.integer  :m_37
      t.integer  :m_38
      t.integer  :m_39
      t.integer  :m_40
      t.integer  :m_41
      t.integer  :m_42
      t.integer  :m_43
      t.integer  :m_44
      t.integer  :m_45
      t.integer  :m_46
      t.integer  :m_47
      t.integer  :m_48
      t.integer  :m_49
      t.integer  :m_50
      t.integer  :total_mark
      t.timestamps
    end
  end

  def self.down
    drop_table :scores
    drop_table :grades
    drop_table :marks
    drop_table :student_marks
  end
end