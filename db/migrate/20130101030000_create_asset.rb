class CreateAsset < ActiveRecord::Migration
  def self.up
    create_table :assetcategories do |t|
      t.integer  :parent_id
      t.string   :description
      t.integer  :cattype_id
      t.timestamps
    end
    
    create_table :assetlosses do |t|
      t.string   :losstype
      t.decimal  :estvalue
      t.integer  :asset_id
      t.integer  :part_id
      t.integer  :losslocation_id
      t.datetime :lossdt
      t.string   :losshow
      t.integer  :lossstafflast_id
      t.boolean  :laststaffcase
      t.boolean  :laststaffstop
      t.boolean  :poreport
      t.string   :porepno
      t.string   :poaction
      t.string   :ponoreportwhy
      t.string   :preventpast
      t.string   :preventfuture
      t.string   :remarks
      t.integer  :hod_id
      t.date     :hodendorsedt
      t.string   :moneytype
      t.boolean  :new
      t.string   :reportcode
      t.integer  :so_id
      t.boolean  :sostop
      t.date     :sostopdt
      t.string   :soaction
      t.boolean  :ownerstop
      t.date     :ownerstopdt
      t.string   :owneraction
      t.boolean  :supstop
      t.date     :supstopdt
      t.string   :supaction
      t.boolean  :rulesbroken
      t.string   :newrule
      t.integer  :newrule_id
      t.string   :nrrecommend
      t.boolean  :surcharge
      t.decimal  :scvalue
      t.string   :screason
      t.integer  :sio_id
      t.integer  :ssecurity_id
      t.date     :closedt
      t.timestamps
    end
    
    create_table :assetnums do |t|
      t.integer  :asset_id
      t.string   :assetnumname
      t.string   :assetadnum     
      t.timestamps
    end
    
    create_table :assets do |t|
      t.string   :assetcode
      t.string   :cardno
      t.integer  :assettype
      t.boolean  :bookable
      t.string   :name
      t.string   :typename
      t.integer  :manufacturer_id
      t.string   :modelname
      t.string   :serialno
      t.text     :otherinfo
      t.string   :orderno
      t.decimal  :purchaseprice
      t.date     :purchasedate
      t.date     :receiveddate
      t.integer  :receiver_id
      t.integer  :supplier_id
      t.integer  :assignedto_id
      t.boolean  :locassigned
      t.integer  :status
      t.integer  :location_id
      t.integer  :country_id
      t.integer  :warranty_length
      t.integer  :warranty_length_type
      t.integer  :category_id
      t.string   :subcategory
      t.integer  :quantity
      t.string   :quantity_type
      t.integer  :engine_type_id
      t.string   :engine_no
      t.string   :registration
      t.string   :nationcode
      t.boolean  :mark_disposal      
      t.timestamps
    end
    
    create_table :assettracks do |t|
      t.integer  :asset_id
      t.integer  :staff_id
      t.date     :reservationdate
      t.date     :use_startdate
      t.date     :use_enddate
      t.integer  :issuedby
      t.date     :issuedate
      t.date     :expectedreturndate
      t.integer  :returnedto
      t.date     :actualreturndate
      t.string   :remarks
      t.timestamps
    end
    
    create_table :disposals do |t|
      t.integer  :asset_id
      t.boolean  :used
      t.string   :usedduration
      t.decimal  :currentvalue
      t.string   :opinion
      t.string   :recommendation
      t.boolean  :gift
      t.boolean  :status
      t.timestamps
    end
    
    create_table :locations do |t|
      t.string   :code
      t.string   :name
      t.integer  :lclass
      t.integer  :typename
      t.boolean  :allocatable
      t.boolean  :occupied
      t.integer  :staffadmin_id
      t.string   :ancestry
      t.timestamps
    end
    
    create_table :maints do |t|
      t.integer  :asset_id
      t.integer  :maintainer_id
      t.string   :workorderno
      t.decimal  :maintcost
      t.text     :details
      t.timestamps
    end
    
    create_table :parts do |t|
      t.string   :partcode
      t.string   :category
      t.string   :unittype
      t.decimal  :quantity
      t.decimal  :maxquantity
      t.decimal  :minquantity
      t.timestamps
    end
    
    create_table :officecars do |t|
      t.string   :car_regno
      t.string   :car_name
      t.integer  :car_type
      t.integer  :power_car
      t.string   :modelcar
      t.integer  :class_car
      t.timestamps
    end
    
    create_table :vehicleregnos do |t|
      t.integer  :staff_id
      t.string   :reg_no
      t.string   :vehicle_type
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
    drop_table :assetnums
    drop_table :assettracks
    drop_table :assetlosses
    drop_table :assetcategories
    drop_table :disposals
    drop_table :locations
    drop_table :maints
    drop_table :parts
    drop_table :officecars
    drop_table :vehicleregnos
  end
end