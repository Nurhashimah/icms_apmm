class Removecolumnstock < ActiveRecord::Migration
  def self.up
   # remove_column :stocks, :quantity_approved
   # remove_column :stocks, :balance_quantity
   # remove_column :stocks, :parcel_no
    #remove_column :stocks, :item_no
    add_column :stockdetails, :remark, :string
  end

  def self.down
  end
end
