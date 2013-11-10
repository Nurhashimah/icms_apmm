class CreateStaffTravel < ActiveRecord::Migration
  def self.up
    create_table :travelallowances do |t|
      t.integer  :travelclaim_id
      t.integer  :allowance_type
      t.decimal  :allowance_per_day
      t.integer  :no_of_day
      t.string   :resit_no
      t.decimal  :sum_allowance
      t.timestamps
    end

    create_table :travelclaimreceipts do |t|
      t.integer  :travelclaim_id
      t.integer  :type_id
      t.string   :receiptnp
      t.decimal  :rvalue
      t.timestamps
    end

    create_table :travelclaimrequests do |t|
      t.integer  :travelclaim_id
      t.integer  :travelrequest_id
      t.decimal  :mileage
      t.timestamps
    end

    create_table :travelclaims do |t|
      t.decimal  :ptclaimsvalue
      t.decimal  :allclaimsvalue
      t.decimal  :othclaimsvalue
      t.decimal  :exchvalue
      t.decimal  :exchloss
      t.decimal  :gtotal
      t.boolean  :claimtype
      t.date     :submission
      t.integer  :hod_id
      t.date     :hodconfirmdt
      t.decimal  :advance
      t.decimal  :payable
      t.integer  :staff_id
      t.date     :claimsmonth
      t.timestamps
    end

    create_table :traveldetailreceipts do |t|
      t.integer  :traveldetail_id
      t.integer  :type_id
      t.string   :receiptnp
      t.decimal  :rvalue
      t.timestamps
    end

    create_table :traveldetails do |t|
      t.integer  :travelclaimrequest_id
      t.date     :travelday
      t.time     :departure
      t.time     :arrival
      t.text     :description
      t.decimal  :distance
      t.decimal  :fare
      t.decimal  :value
      t.boolean  :lodging
      t.boolean  :meals
      t.boolean  :dinner
      t.integer  :travelrequest_id
      t.string   :location_from
      t.string   :location_to
      t.timestamps
    end

    create_table :travelrequests do |t|
      t.integer  :staff_id
      t.string   :trcode
      t.string   :destination
      t.string   :purpose
      t.date     :tstartdt
      t.date     :treturndt
      t.boolean  :owncar
      t.boolean  :officecar
      t.boolean  :otherscar
      t.boolean  :train
      t.boolean  :plane
      t.boolean  :publict
      t.string   :ifownwhy
      t.boolean  :claimtype
      t.date     :submission
      t.integer  :replacement_id
      t.integer  :hod_id
      t.date     :hodconfirmdt
      t.integer  :travelclaims_id
      t.integer  :asset_id
      t.string   :fuelstart
      t.string   :fuelend
      t.string   :tngserialno
      t.string   :tngbeforetakenout
      t.string   :tngaftertakenout
      t.boolean  :hod_approved
      t.integer  :transport_travel
      t.boolean  :reason_1
      t.boolean  :reason_2
      t.boolean  :reason_3
      t.boolean  :reason_4
      t.boolean  :reason_5
      t.boolean  :reason_6
      t.boolean  :reason_7
      t.boolean  :reason_8
      t.string   :remark_approver
      t.timestamps
    end
    
    
    create_table :passengers do |t|
      t.integer  :staff_id
      t.integer  :bookingvehicle_id
      t.timestamps
    end
  end

  def self.down
    drop_table :travelallowances
    drop_table :travelclaimreceipts
    drop_table :travelclaimrequests
    drop_table :travelclaims
    drop_table :traveldetailreceipts
    drop_table :traveldetails
    drop_table :travelrequests
    drop_table :passengers
  end
end