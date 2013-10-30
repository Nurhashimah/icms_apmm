class ChangeColoumnPhoneHomeToTypeString < ActiveRecord::Migration
  def self.up
    change_column :staffs, :phonehome, :string
  end

  def self.down
    change_column :staffs, :phonehome, :integer
  end
end
