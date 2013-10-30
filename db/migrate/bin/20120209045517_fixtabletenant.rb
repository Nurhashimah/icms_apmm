class Fixtabletenant < ActiveRecord::Migration
  def self.up
    remove_column :tenants, :staff_id
    remove_column :tenants, :student_id
    remove_column :tenants, :keyaccept
    remove_column :tenants, :keyexpectedreturn
    remove_column :tenants, :keyreturned
    remove_column :tenants, :force_vacate
    
  end

  def self.down
    remove_column :tenants, :staff_id
    remove_column :tenants, :student_id
    remove_column :tenants, :keyaccept
    remove_column :tenants, :keyexpectedreturn
    remove_column :tenants, :keyreturned
    remove_column :tenants, :force_vacate
  end
end
