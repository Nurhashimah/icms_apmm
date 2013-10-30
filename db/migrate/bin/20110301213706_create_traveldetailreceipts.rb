class CreateTraveldetailreceipts < ActiveRecord::Migration
  def self.up
    create_table :traveldetailreceipts do |t|
      t.integer :traveldetail_id
      t.integer :type_id
      t.string :receiptnp
      t.decimal :rvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :traveldetailreceipts
  end
end
