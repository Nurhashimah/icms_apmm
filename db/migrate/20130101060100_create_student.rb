class CreateStudent < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string   :icno
      t.string   :name
      t.string   :statecd
      t.string   :sstatus
      t.string   :stelno
      t.string   :ssponsor
      t.integer  :gender
      t.date     :sbirthdt
      t.integer  :mrtlstatuscd
      t.string   :semail
      t.date     :start_training
      t.integer  :course_id
      t.integer  :specilisation
      t.integer  :approve_id
      t.string   :pangkat
      t.string   :unit
      t.string   :phoneoffice
      t.string   :bloodtype
      t.string   :phonehome
      t.text     :remarks
      t.string   :religion
      t.string   :race
      t.text     :address
      t.text     :office_address
      t.date     :end_training
      t.string   :intake
      t.integer  :vehicletype
      t.string   :vehicleregno
      t.string   :poskod
      t.boolean  :accomodation
      t.boolean  :dish
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.integer  :intake_id
      t.timestamps
    end
    
    create_table :exworks do |t|
      t.string   :organisation_name
      t.string   :position_name
      t.string   :place
      t.integer  :student_id
      t.timestamps
    end
    
    create_table :spmresults do |t|
      t.integer  :student_id
      t.string   :spm_subject
      t.integer  :spmsubject_id
      t.string   :grade
      t.timestamps
    end
    
  end

  def self.down
    drop_table :students
    drop_table :exworks
    drop_table :spmresults
  end
end