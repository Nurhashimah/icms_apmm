class Fixcolumnoffice < ActiveRecord::Migration
  def self.up
    
    #add field to supplier
    add_column :suppliers, :item_details, :string
    add_column :suppliers, :sub_category, :string
    add_column :suppliers, :item_type, :string
    add_column :suppliers, :store_name, :string
    
    #add field to addsupplier
    add_column :addsuppliers, :addressbook_id, :integer
    add_column :addsuppliers, :big_quantity, :integer
    add_column :addsuppliers, :big_unittype, :string
    add_column :addsuppliers, :small_quantity, :integer
    add_column :addsuppliers, :small_unittype, :string
    add_column :addsuppliers, :nisbah_quantity, :integer
   add_column :addsuppliers, :received_by, :integer
    
    #add field to usesupplier
    add_column :usesupplies, :ref_no, :string
    add_column :usesupplies, :remark, :string
  end

  def self.down
  end
end
