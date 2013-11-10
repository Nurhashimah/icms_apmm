class CreateEvent < ActiveRecord::Migration
  def self.up
    create_table :bulletins  do |t|
      t.string   :headline
      t.text     :content
      t.integer  :postedby_id
      t.date     :publishdt
      t.string   :data_file_name
      t.string   :data_content_type
      t.integer  :data_file_size
      t.datetime :data_updated_at
      t.timestamps
    end
    
    create_table :events do |t|
      t.string   :eventname
      t.string   :location
      t.text     :participants
      t.string   :officiated
      t.datetime :eventstdt
      t.datetime :eventendt
      t.integer  :createdby
      t.boolean  :event_is_publik
      t.timestamps
    end
    
    create_table :localmessages do |t|
      t.integer  :from_id
      t.integer  :to_id
      t.text     :message
      t.timestamps
    end
    
    create_table :messages do |t|
      t.integer  :from_id
      t.integer  :to_id
      t.text     :message
      t.string   :title
      t.integer  :cc_id
      t.timestamps
    end

    create_table :messages_staffs, :id => false do |t|
      t.integer :message_id
      t.integer :staff_id
    end
  end

  def self.down
    drop_table :bulletins
    drop_table :events
    drop_table :localmessages
    drop_table :messages
    drop_table :messages_staffs
  end
end