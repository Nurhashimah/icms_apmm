class UpdateFieldsBasedOnReview < ActiveRecord::Migration
  def self.up
    rename_column :librarytransactions, :staff, :r_u_staff
  end

  def self.down
    
  end
end
