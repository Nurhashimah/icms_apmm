class UpdateStaffgrades < ActiveRecord::Migration
  def self.up
    remove_column :staffgrades, :name
    remove_column :staffgrades, :staffscheme_id
  end

  def self.down
  end
end
