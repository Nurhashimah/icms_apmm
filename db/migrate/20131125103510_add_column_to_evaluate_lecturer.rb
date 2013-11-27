class AddColumnToEvaluateLecturer < ActiveRecord::Migration
  def self.up
    add_column :evaluate_lecturers, :average_lecturer_id, :integer
  end

  def self.down
    remove_column :evaluate_lecturers, :average_lecturer_id
  end
end
