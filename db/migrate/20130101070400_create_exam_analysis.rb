class CreateExamAnalysis < ActiveRecord::Migration
  def self.up
    create_table :analysis_grades do |t|
      t.integer  :course_id
      t.integer  :class_id
      t.string   :exam_name
      t.date     :exam_date
      t.integer  :staff_id
      t.integer  :student_id
      t.integer  :exam_paper_name
      t.integer  :fm_1
      t.integer  :fm_2
      t.integer  :fm_3
      t.integer  :fm_4
      t.integer  :fm_5
      t.integer  :fm_6
      t.integer  :fm_7
      t.integer  :fm_8
      t.integer  :fm_9
      t.integer  :fm_10
      t.integer  :fm_11
      t.integer  :fm_12
      t.integer  :fm_13
      t.integer  :fm_14
      t.integer  :fm_15
      t.integer  :fm_16
      t.integer  :fm_17
      t.integer  :fm_18
      t.integer  :fm_19
      t.integer  :fm_20
      t.integer  :fm_21
      t.integer  :fm_22
      t.integer  :fm_23
      t.integer  :fm_24
      t.integer  :fm_25
      t.integer  :fm_26
      t.integer  :fm_27
      t.integer  :fm_28
      t.integer  :fm_29
      t.integer  :fm_30
      t.integer  :fm_31
      t.integer  :fm_32
      t.integer  :fm_33
      t.integer  :fm_34
      t.integer  :fm_35
      t.integer  :fm_36
      t.integer  :fm_37
      t.integer  :fm_38
      t.integer  :fm_39
      t.integer  :fm_40
      t.integer  :fm_41
      t.integer  :fm_42
      t.integer  :fm_43
      t.integer  :fm_44
      t.integer  :fm_45
      t.integer  :fm_46
      t.integer  :fm_47
      t.integer  :fm_48
      t.integer  :fm_49
      t.integer  :fm_50
      
      t.timestamps
    end
    
    create_table :analysispaperexams do |t|
      t.integer  :course_id
      t.integer  :class_id
      t.integer  :exam_id
      t.date     :exam_date
      t.integer  :student_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :analysispaperexams
    drop_table :analysis_grades
  end
end