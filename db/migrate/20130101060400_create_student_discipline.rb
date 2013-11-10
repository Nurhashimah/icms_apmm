class CreateStudentDiscipline < ActiveRecord::Migration
  def self.up
    create_table :sdiciplines do |t|
      t.integer  :reportedby_id
      t.integer  :student_id
      t.text     :details
      t.integer  :cofile_id
      t.datetime :casedt
      t.string   :referredby
      t.text     :investigation
      t.string   :status
      t.text     :action
      t.date     :closedtcollege
      t.string   :location
      t.text     :otherinfo
      t.date     :commandantdt
      t.date     :jtkpdt
      t.text     :jtkpdecision
      t.date     :jtkpdescisionrxdt
      t.date     :appealdt
      t.text     :appealdecision
      t.date     :appealdecisionrxdt
      t.integer  :supplier_id
      t.integer  :infraction
      t.integer  :warden_id
      t.integer  :mentor_id
      t.integer  :caunsellor_id
      t.integer  :commandant_id
      t.string   :principal_takeaction
      t.string   :principal_investigation
      t.date     :principal_datetakeaction
      t.date     :reportteddt
      t.boolean  :ru_staff
      t.timestamps
    end
    
    create_table :counsellings do |t|
      t.integer  :student_id
      t.integer  :cofile_id
      t.timestamps
    end
    
    create_table :scsessions do |t|
      t.integer  :counselling_id
      t.datetime :scsessiondt
      t.time     :scsessiondtduration
      t.integer  :scsappointnum
      t.string   :scsessiontype
      t.string   :issue
      t.text     :suggestion
      t.text     :remarks
      t.timestamps
    end
    
    create_table :mentees do |t|
      t.integer  :student_id
      t.integer  :mentor_id
      t.timestamps
    end

    create_table :mentors do |t|
      t.integer  :staff_id
      t.date     :mentor_date
      t.string   :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :sdiciplines
    drop_table :counsellings
    drop_table :scsessions
    drop_table :mentees
    drop_table :mentors
  end
end