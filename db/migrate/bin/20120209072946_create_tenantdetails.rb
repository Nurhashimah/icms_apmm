class CreateTenantdetails < ActiveRecord::Migration
  def self.up
    create_table :tenantdetails do |t|
       t.integer :tenant_id
        t.integer :staff_id
        t.integer :student_id
        t.date :keyaccept
        t.date :keyexpectedreturn
        t.date :keyreturned
        t.boolean :force_vacate
        t.string :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :tenantdetails
  end
end
