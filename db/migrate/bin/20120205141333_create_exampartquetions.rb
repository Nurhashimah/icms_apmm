class CreateExampartquetions < ActiveRecord::Migration
  def self.up
    create_table :exampartquetions do |t|
      t.integer :exammaker_id
      t.integer :examquestion_id
      t.text :part_name
      t.timestamps
    end
  end

  def self.down
    drop_table :exampartquetions
  end
end
