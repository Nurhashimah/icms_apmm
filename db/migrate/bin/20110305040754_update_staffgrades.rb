class UpdateStaffgrades < ActiveRecord::Migration
  def self.up
    add_column    :staffgrades, :classification_id, :string
    add_column    :staffgrades, :group_id, :string
    rename_column :staffgrades, :sgshortname, :grade       #built from classification_id + level
    rename_column :staffgrades, :sgname, :name
    rename_column :staffgrades, :sglevel, :level
    add_column    :staffgrades, :schemename, :string       #looks like position
    rename_table  :staffgrades, :staff_grades
  end

  def self.down
    remove_column    :staffgrades, :classification_id
    remove_column    :staffgrades, :group_id
  end
end
