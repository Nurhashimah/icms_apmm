class CreateFilling < ActiveRecord::Migration
  def self.up
    create_table :circulates do |t|
      t.integer  :document_id
      t.integer  :cc_staff
      t.integer  :action_cc
      t.timestamps
    end
    
    create_table :cofiles do |t|
      t.string   :cofileno
      t.string   :name
      t.string   :location
      t.integer  :owner_id
      t.boolean  :onloan
      t.integer  :staffloan_id
      t.date     :onloandt
      t.date     :onloanxdt
      t.timestamps
    end
    
    create_table :docs do |t|
      t.integer  :curriculum_id
      t.integer  :cofile_id
      t.string   :name
      t.decimal  :version
      t.string   :description
      t.timestamps
    end
    
    create_table :documents do |t|
      t.string   :serialno
      t.string   :refno
      t.integer  :category
      t.string   :title
      t.date     :letterdt
      t.date     :letterxdt
      t.string   :from
      t.integer  :stafffiled_id
      t.integer  :file_id
      t.boolean  :closed
      t.string   :data_file_name
      t.string   :data_content_type
      t.integer  :data_file_size
      t.datetime :data_updated_at
      t.text     :otherinfo
      t.integer  :cctype_id
      t.integer  :cc1staff_id
      t.date     :cc1date
      t.string   :cc1action
      t.text     :cc1remarks
      t.boolean  :cc1closed
      t.integer  :cc2staff_id
      t.date     :cc2date
      t.string   :cc2action
      t.text     :cc2remarks
      t.boolean  :cc2closed
      t.integer  :classification
      t.boolean  :feedback_sent
      t.integer  :action_by
      t.boolean  :received
      t.date     :received_date
      t.timestamps
    end

    create_table :documents_staffs, :id => false do |t|
      t.integer :document_id
      t.integer :staff_id
    end
    
    create_table :downloads do |t|
      t.string   :document_file_name
      t.string   :document_content_type
      t.integer  :document_file_size
      t.datetime :document_updated_at
      t.string   :doc_name
      t.integer  :staff_id
      t.string   :doc_group
      t.date     :upload_date
      t.timestamps
    end
    
  end

  def self.down
    drop_table :circulates
    drop_table :cofiles
    drop_table :docs
    drop_table :documents
    drop_table :documents_staffs
    drop_table :downloads
  end
end