class CreateSupport < ActiveRecord::Migration
  def self.up
    create_table :banks do |t|
      t.string   :short_name
      t.string   :long_name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean  :active
      t.timestamps
    end
    
    create_table :employgrades do |t|
      t.string   :name
      t.integer  :group_id
      t.integer  :yearly_leave
      t.timestamps
    end
    
    create_table :titles do |t|
      t.string   :titlecode
      t.string   :name
      t.boolean  :berhormat
      t.timestamps
    end
  end

  def self.down
    drop_table :banks
    drop_table :employgrades
    drop_table :titles
  end
  
  
end