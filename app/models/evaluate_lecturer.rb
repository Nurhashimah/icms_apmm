class EvaluateLecturer < ActiveRecord::Base
  belongs_to :studentevaluate,   :class_name => 'Student',   :foreign_key => 'student_id'
  belongs_to :stucourse,         :class_name => 'Programme', :foreign_key => 'course_id'
  belongs_to :subjectevaluate,   :class_name => 'Subject',   :foreign_key => 'subject_id'
  belongs_to :staffevaluate,     :class_name => 'Staff',     :foreign_key => 'staff_id' 
  
  has_many :lecturer,       :class_name => 'Averagelecturer', :foreign_key => 'lecturer_id'
  
  def lecturer_evaluate
    if staffevaluate.blank?
      "-"
    else
      staffevaluate.staff_name_with_title
    end
  end
  
  def lecturer_evaluate_icno
     if staffevaluate.blank?
       "-"
     else
       staffevaluate.formatted_mykad
     end
   end
   
   def lecturer_evaluate_rank
      if staffevaluate.blank?
        "-"
      else
        staffevaluate.position_for_staff
      end
    end
  
  def course_evaluate
    if stucourse.blank?
      "-"
    else
      stucourse.name
    end
  end
  
  def course_type_evaluate
     if stucourse.blank?
       "-"
     else
       stucourse.specialisation
     end
   end
  
  def subject_evaluate
    if subjectevaluate.blank?
      "-"
    else
      subjectevaluate.name
    end
  end
  
  def evaluate_detail
    "#{lecturer_evaluate} | #{course_evaluate} | #{subject_evaluate} "
  end
  
  validates_presence_of :evaluate_date
end
