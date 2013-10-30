class FixThingsInGrade < ActiveRecord::Migration
  def self.up
    rename_column :grades, :total_formative, :formative
    remove_column :scores, :actual_score
    add_column    :grades, :exam1name, :string
    add_column    :grades, :exam1desc, :string
    add_column    :grades, :exam1marks,:decimal
    add_column    :grades, :exam2name, :string
    add_column    :grades, :exam2desc, :string
    add_column    :grades, :exam2marks, :decimal
    add_column    :grades, :examweight, :decimal
    rename_column :grades, :total_summative, :summative
    rename_column :grades, :total_marks, :finalscore
  end

  def self.down
    rename_column :grades, :formative, :total_formative
    add_column    :scores, :actual_score, :decimal
    remove_column    :grades, :exam1name
    remove_column    :grades, :exam1desc
    remove_column    :grades, :exam1marks
    remove_column    :grades, :exam2name
    remove_column    :grades, :exam2desc
    remove_column    :grades, :exam2marks
    remove_column    :grades, :examweight
    rename_column :grades, :summative, :total_summative
    rename_column    :grades,  :finalscore, :total_marks
  end
end