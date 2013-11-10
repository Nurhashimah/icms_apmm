class CreateStaffAppraisal < ActiveRecord::Migration
  def self.up
    create_table :appraisals do |t|
      t.integer  :staff_id
      t.date     :evaldt
      t.date     :parttwodt
      t.decimal  :pppquantity
      t.decimal  :ppkquantity
      t.decimal  :pppquality
      t.decimal  :ppkquality
      t.decimal  :pppontime
      t.decimal  :ppkontime
      t.decimal  :pppeffective
      t.decimal  :ppkeffective
      t.decimal  :pppknowledge
      t.decimal  :ppkknowledge
      t.decimal  :ppprules
      t.decimal  :ppkrules
      t.decimal  :pppcommunication
      t.decimal  :ppkcommunication
      t.decimal  :pppleader
      t.decimal  :ppkleader
      t.decimal  :pppmanage
      t.decimal  :ppkmanage
      t.decimal  :pppdiscipline
      t.decimal  :ppkdisipline
      t.decimal  :pppproactive
      t.decimal  :ppkproactive
      t.decimal  :ppprelate
      t.decimal  :ppkrelate
      t.decimal  :pppparttwo
      t.decimal  :ppkparttwo
      t.decimal  :ppptotals
      t.decimal  :ppktotals
      t.decimal  :ppppercent
      t.decimal  :ppkpercent
      t.decimal  :pointsaverage
      t.integer  :pppyears
      t.integer  :pppmonths
      t.text     :pppoverall
      t.text     :pppadvancemet
      t.integer  :ppp_id
      t.date     :pppevaldt
      t.integer  :ppkyears
      t.integer  :ppkmonths
      t.text     :ppkoverall
      t.integer  :ppk_id
      t.date     :ppkevaldt
      t.timestamps
    end
    
    create_table :evactivities do |t|
      t.integer  :appraisal_id
      t.date     :evaldt
      t.string   :evactivity
      t.string   :actlevel
      t.date     :actdt
      t.timestamps
    end
    
    create_table :instructors do |t|
      t.integer  :staff_id
      t.date     :appraisaldate
      t.boolean  :qcsent
      t.integer  :q1
      t.integer  :q2
      t.integer  :q3
      t.integer  :q4
      t.integer  :q5
      t.integer  :q6
      t.integer  :q7
      t.integer  :q8
      t.integer  :q9
      t.integer  :q10
      t.integer  :q11
      t.integer  :q12
      t.integer  :q13
      t.integer  :q14
      t.integer  :q15
      t.integer  :q16
      t.integer  :q17
      t.integer  :q18
      t.integer  :q19
      t.integer  :q20
      t.integer  :q21
      t.integer  :q22
      t.integer  :q23
      t.integer  :q24
      t.integer  :q25
      t.integer  :q26
      t.integer  :q27
      t.integer  :q28
      t.integer  :q29
      t.integer  :q30
      t.integer  :q31
      t.integer  :q32
      t.integer  :q33
      t.integer  :q34
      t.integer  :q35
      t.integer  :q36
      t.integer  :q37
      t.integer  :q38
      t.integer  :q39
      t.integer  :q40
      t.integer  :q41
      t.integer  :q42
      t.integer  :q43
      t.integer  :q44
      t.integer  :q45
      t.integer  :q46
      t.integer  :q47
      t.integer  :q48
      t.integer  :total_mark
      t.integer  :check_qc
      t.date     :check_date
      t.boolean  :checked
      t.timestamps
    end
    
    create_table :skt_achives do |t|
      t.integer  :skt_target_id
      t.integer  :performance
      t.string   :performance_detail
      t.string   :target_work
      t.string   :actual_achieve
      t.string   :percent_achieve
      t.string   :comment
      t.timestamps
    end

    create_table :skt_staffs do |t|
      t.date     :datepyd_part1
      t.date     :dateppp_part1
      t.string   :report_pyd
      t.string   :report_ppp
      t.date     :datereport_pyd
      t.date     :datereport_ppp
      t.date     :date_performance
      t.integer  :pyd_id
      t.integer  :pp_id
      t.integer  :ppp_id
      t.timestamps
    end

    create_table :skt_targets do |t|
      t.integer  :skt_staff_id
      t.string   :activity
      t.integer  :status
      t.integer  :approved
      t.timestamps
    end
  end

  def self.down
    drop_table :appraisals
    drop_table :evactivities
    drop_table :instructors
    drop_table :skt_achives
    drop_table :skt_staffs
    drop_table :skt_targets
  end
end