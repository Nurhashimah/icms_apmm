class Evenmoreupdates < ActiveRecord::Migration
  def self.up
    remove_column :events, :createdby
    add_column    :events, :createdby, :integer
  end

  def self.down
  end
end
