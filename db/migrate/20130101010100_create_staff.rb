class CreateStaff < ActiveRecord::Migration
  def self.up
    create_table :staffs do |t|
      t.string   :icno
      t.string   :name
      t.integer  :titlecd_id
      t.string   :code
      t.string   :fileno
      t.integer  :position_old
      t.string   :coemail
      t.date     :cobirthdt
      t.string   :bloodtype
      t.string   :cooftelno
      t.string   :cooftelext
      t.string   :addr
      t.integer  :poskod_id
      t.integer  :mrtlstatuscd
      t.integer  :statecd
      t.integer  :country_cd
      t.string   :employscheme
      t.integer  :employstatus
      t.string   :appointstatus
      t.date     :appointdt
      t.date     :schemedt
      t.date     :confirmdt
      t.date     :posconfirmdate
      t.string   :appointby
      t.string   :svchead
      t.string   :svctype
      t.string   :pensionstat
      t.date     :pensiondt
      t.string   :uniformstat
      t.string   :kwspcode
      t.string   :taxcode
      t.string   :bank
      t.string   :bankaccno
      t.string   :bankacctype
      t.integer  :race
      t.integer  :religion
      t.string   :phonecell
      t.string   :phonehome
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.integer  :staffgrade_id
      t.integer  :gender
      t.date     :pension_confirm_date
      t.date     :wealth_decleration_date
      t.date     :promotion_date
      t.date     :reconfirmation_date
      t.date     :to_current_grade_date
      t.decimal  :starting_salary
      t.string   :transportclass_id
      t.integer  :country_id
      t.string   :birthcertno
      t.string   :vehicleregno
      t.boolean  :license_A
      t.boolean  :license_B
      t.boolean  :license_C
      t.boolean  :license_D
      t.boolean  :license_E
      t.boolean  :license_F
      t.timestamps
    end
    
    create_table :qualifications do |t|
      t.integer  :staff_id
      t.integer  :student_id
      t.integer  :level_id
      t.string   :qname
      t.integer  :institute_id
      t.string   :institute
      t.timestamps
    end
    
    create_table :kins do |t|
      t.integer  :kintype_id
      t.integer  :staff_id
      t.integer  :student_id
      t.string   :name
      t.date     :kinbirthdt
      t.string   :phone
      t.string   :kinaddr
      t.string   :profession
      t.string   :mykadno
      t.timestamps
    end
    
    create_table :loans do |t|
      t.integer  :staff_id
      t.integer  :ltype
      t.string   :accno
      t.date     :startdt
      t.integer  :durationmn
      t.decimal  :deductions
      t.timestamps
    end
    
    create_table :bankaccounts do |t|
      t.integer  :staff_id
      t.integer  :student_id
      t.integer  :bank_id
      t.string   :account_no
      t.integer  :account_type
      t.timestamps
    end
    
    create_table :positions do |t|
      t.string   :positioncode
      t.string   :positionname
      t.string   :unit
      t.text     :taskmain
      t.text     :taskother
      t.integer  :parent_id
      t.integer  :staffgrade_id
      t.integer  :staff_id
      t.timestamps
    end
    
    create_table :staff_grades do |t|
      t.string   :name
      t.string   :grade
      t.integer  :level
      t.string   :classification_id
      t.string   :group_id
      t.string   :schemename
      t.timestamps
    end
    
    create_table :staffemploygrades do |t|
      t.integer  :staffemployscheme_id
      t.integer  :employgrade_id
      t.string   :name
      t.timestamps
    end

    create_table :staffemployschemes do |t|
      t.string   :glass
      t.string   :name
      t.timestamps
    end
  end

  def self.down
    drop_table :qualifications
    drop_table :kins
    drop_table :loans
    drop_table :bankaccounts
    drop_table :positions
    drop_table :staff_grades
    drop_table :staffemploygrades
    drop_table :staffemployschemes

  end
end