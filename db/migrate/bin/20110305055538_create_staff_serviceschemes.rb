class CreateStaffServiceschemes < ActiveRecord::Migration
  def self.up
    create_table :staff_serviceschemes do |t|
      t.string :name
      t.integer :staff_grade_id

      t.timestamps
    end
  end

  def self.down
    drop_table :staff_serviceschemes
  end
end
