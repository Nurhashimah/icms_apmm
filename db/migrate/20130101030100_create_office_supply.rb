class CreateOfficeSupply < ActiveRecord::Migration
  def self.up
    create_table :stockcards do |t|
      t.integer  :stock_id
      t.integer  :supplier_id
      t.integer  :quantity
      t.timestamps
    end

    create_table :stockdetails do |t|
      t.integer  :stock_id
      t.integer  :supplier_id
      t.integer  :quantity_order
      t.integer  :quantity_approve
      t.string   :remark
      t.timestamps
    end

    create_table :stocks do |t|
      t.string   :app_no
      t.integer  :supplier_id
      t.string   :quantity_order
      t.integer  :staff_id
      t.date     :app_date
      t.boolean  :received
      t.date     :received_date
      t.integer  :approver_id
      t.string   :remark
      t.date     :approve_date
      t.boolean  :approval
      t.integer  :storeman_id
      t.date     :date_update
      t.boolean  :sent
      t.integer  :status
      t.timestamps
    end
    
    create_table :suppliers do |t|
      t.string   :supplycode
      t.string   :category
      t.string   :unittype
      t.integer  :maxquantity
      t.integer  :minquantity
      t.string   :item_details
      t.string   :sub_category
      t.string   :item_type
      t.string   :store_name
      t.integer  :stationery_id
      t.timestamps
    end
    
    create_table :addsuppliers  do |t|
      t.integer  :supplier_id
      t.string   :lpono
      t.string   :document
      t.integer  :quantity
      t.decimal  :unitcost
      t.date     :received
      t.integer  :addressbook_id
      t.integer  :big_quantity
      t.integer  :big_unittype
      t.integer  :small_quantity
      t.integer  :small_unittype
      t.integer  :nisbah_quantity
      t.integer  :received_by 
      t.timestamps
    end
    
    create_table :rxparts do |t|
      t.integer  :part_id
      t.string   :lponum
      t.string   :donum
      t.decimal  :quantity
      t.decimal  :unitcost
      t.decimal  :totalcost
      t.date     :rdate
      t.timestamps
    end
    
    create_table :txsupplies do |t|
      t.integer  :part_id
      t.integer  :receiver_id
      t.decimal  :quantity
      t.date     :tdate
      t.text     :details
      t.timestamps
    end
    
    create_table :usesupplies do |t|
      t.integer  :supplier_id
      t.integer  :issuedby
      t.integer  :receivedby
      t.integer  :quantity
      t.date     :issuedate
      t.string   :ref_no
      t.string   :remark
      t.integer  :stock_detail
      t.timestamps
    end
  end

  def self.down
    drop_table :stockcards
    drop_table :stockdetails
    drop_table :stocks
    drop_table :suppliers
    drop_table :addsuppliers
    drop_table :rxparts
    drop_table :txsupplies
    drop_table :usesupplies
  end
end