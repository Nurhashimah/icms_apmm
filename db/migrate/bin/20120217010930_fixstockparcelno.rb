class Fixstockparcelno < ActiveRecord::Migration
  def self.up
    add_column :stocks, :item_no, :integer
  end

  def self.down
      remove_column :stocks, :item_no, :integer
  end
end
