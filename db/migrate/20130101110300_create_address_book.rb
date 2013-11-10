class CreateAddressBook < ActiveRecord::Migration
  def self.up
    create_table :addbooks do |t|
      t.string   :name
      t.string   :phone
      t.string   :address
      t.string   :mail
      t.string   :web
      t.string   :fax
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :shortname
            
      t.timestamps
    end
  end

  def self.down
    drop_table :addbooks
  end
end