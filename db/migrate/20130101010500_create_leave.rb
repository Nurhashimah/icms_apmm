class CreateLeave < ActiveRecord::Migration
  def self.up
    create_table :leaveforstaffs do |t|
      t.integer  :staff_id
      t.integer  :leavetype
      t.date     :leavestartdate
      t.date     :leavenddate
      t.decimal  :leavedays
      t.string   :reason
      t.text     :notes
      t.integer  :replacement_id
      t.boolean  :submit
      t.boolean  :approval1
      t.integer  :approval1_id
      t.date     :approval1date
      t.boolean  :approver2
      t.integer  :approval2_id
      t.date     :approval2date
      t.string   :address_on_leave
      t.string   :phone_on_leave
      t.string   :leave_before_app
      t.integer  :adminofficer1_id
      t.date     :date_before_app
      t.boolean  :proceed
      t.string   :leave_after_app
      t.integer  :adminofficer2_id
      t.boolean  :date_after_leave
      t.timestamps
    end
    
    create_table :leaveforstudents do |t|
      t.integer  :student_id
      t.string   :leavetype
      t.date     :requestdate
      t.string   :reason
      t.string   :address
      t.string   :telno
      t.date     :leave_startdate
      t.date     :leave_enddate
      t.boolean  :studentsubmit
      t.boolean  :approved
      t.integer  :staff_id
      t.date     :approvedate
      t.text     :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :leaveforstaffs
    drop_table :leaveforstudents
  end
end