class Fixcolumnstock < ActiveRecord::Migration
  def self.up
    change_column :stocks, :app_no,  :string
    add_column :stocks, :status, :integer
  end

  def self.down
    change_column :stocks, :app_no,  :integer
    remove_column :stocks, :status, :integer
  end
end
