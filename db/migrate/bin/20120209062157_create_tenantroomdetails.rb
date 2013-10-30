class CreateTenantroomdetails < ActiveRecord::Migration
  def self.up
    create_table :tenantroomdetails do |t|
      t.integer :tenant_id
      t.integer :staff_id
      t.integer :student_id
      t.date :keyaccept
      t.date :keyexpectedreturn
      t.date :keyreturned
      t.boolean :force_vacate
      t.timestamps
    end
  end

  def self.down
    drop_table :tenantroomdetails
  end
end
