class AverageLecturer < ActiveRecord::Base
  
belongs_to :lecturer,     :class_name => 'EvaluateLecturer',     :foreign_key => 'lecturer_id'
belongs_to :principal,     :class_name => 'Staff',     :foreign_key => 'principal_id'

CATEGORY = [
    #  Displayed       stored in db
    [ "Layak",             "1" ],
    [ "Tidak Layak",      "2" ]
  ]
end
