class CreateEvaluateCoaches < ActiveRecord::Migration
  def self.up
    create_table :evaluate_coaches do |t|
 t.integer :course_id
      t.integer :staff_id
      t.integer :subject_id
      t.integer :class_id
      t.date    :evaluate_date
      t.time    :start_time
      t.time    :end_time
      t.boolean :objective
      t.boolean :status
      t.string  :remark
      
      #Persediaan Part
      t.integer :intro_plan
      t.integer :intro_abm
      t.integer :intro_att
      t.integer :intro_title
      t.integer :intro_obj
      t.integer :intro_ref
      t.integer :intro_exp
      
      #Penyampaian Part
      t.integer :d_dev
      t.integer :d_interest
      t.integer :d_control
      t.integer :d_habit
      t.integer :d_emp
      t.integer :d_class
      t.integer :d_inv
      t.integer :d_abm
      t.integer :d_knowledge
      
      #Rumusan part
      
      t.integer :sum_rev
      t.integer :sum_chance
      
      #Soalan
      
      t.integer :q_rangka
      t.integer :q_merangkumi
      t.integer :q_tujukan
      t.integer :q_soalan
      t.integer :q_bina
      t.integer :q_future
      t.integer :q_time
		
	  #Jumlah
	  t.integer :result
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :evaluate_coaches
  end
end
