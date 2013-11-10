class CreateAssetBooking < ActiveRecord::Migration
  def self.up
    create_table :bookingfacilities do |t|
      t.integer  :staff_id
      t.integer  :location_id
      t.date     :requestdate
      t.datetime :start_date
      t.datetime :end_date
      t.boolean  :approval
      t.integer  :approver_id
      t.date     :approve_date
      t.string   :remark
      t.integer  :facility_officer
      t.boolean  :approver2
      t.string   :remark_officer
      t.date     :date_approver2
      t.timestamps
    end
    
    create_table :bookingvehicles do |t|
      t.integer  :applicant
      t.date     :used_date
      t.date     :returned_date
      t.string   :location
      t.date     :apply_date
      t.integer  :approved
      t.integer  :approver_name
      t.date     :approved_date
      t.string   :remark
      t.integer  :vehicle_id
      t.integer  :endorse_name
      t.date     :endorse_date
      t.integer  :endorsed
      t.string   :remark_approver
      t.integer  :driver_name
      t.timestamps
    end
    
    create_table :residences do |t|
      t.string   :rescode
      t.string   :resname
      t.integer  :parent_id
      t.integer  :resclass
      t.integer  :restype
      t.boolean  :allocatable
      t.integer  :staff_id
      t.integer  :student_id
      t.date     :keytxdt
      t.date     :keyreturndt
      t.date     :keyexpectdate
      t.boolean  :keyrx
      t.integer  :staffadmin_id
      t.string   :ancestry
      t.timestamps
    end
    add_index :residences, :ancestry
    
    create_table :tenants do |t|
      t.integer  :location_id
      t.integer  :staff_id
      t.integer  :student_id
      t.date     :keyaccept
      t.date     :keyexpectedreturn
      t.date     :keyreturned
      t.boolean  :force_vacate
      t.date     :lockerkey_received_date
      t.date     :lockerkey_returned_date
      t.timestamps
    end
  end

  def self.down
    drop_table :bookingfacilities
    drop_table :bookingvehicles
    remove_index :residences, :ancestry
    drop_table :residences
    drop_table :tenants
  end
end