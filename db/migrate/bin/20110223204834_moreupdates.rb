class Moreupdates < ActiveRecord::Migration
  def self.up
    rename_column :librarytransactions, :staff, :ru_staff
  end

  def self.down
  end
end
