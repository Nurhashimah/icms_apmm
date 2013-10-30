class Exampartquestion < ActiveRecord::Migration
  def self.up 
  	create_table :exampartquestions do |t|
	  t.integer :exammaker_id
      t.integer :examquestion_id
      t.text :part_name

      t.timestamps
  	end
  end

  def self.down
  	drop_table :exampartquestions
  end
end
