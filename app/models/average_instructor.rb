class AverageInstructor < ActiveRecord::Base
  require 'decimal'   #6March 2013
	
    #belongs_to :evaluated_instructor,     :class_name => 'Instructor', :foreign_key => 'instructor_id'   #6 March 2013 - previous : instructor_eval
    belongs_to :evaluated_instructor,     :class_name => 'Staff', :foreign_key => 'instructor_id'         #6 March 2013 - amended : but in _form.html.erb (instructor list->select fr staff but must exist in instructor[instructor appraisal])
    belongs_to :instructor_course,        :class_name => 'Programme', :foreign_key => 'programme_id'      #6 March 2013
    belongs_to :instructor_evaluator,     :class_name => 'Staff', :foreign_key => 'evaluator_id'          #6 march 2013 
    
    validates_presence_of :instructor_id,:deliverytype,:pbq1,:pbq2,:pbq3,:pbq4,:pdq1,:pdq2,:pdq3,:pdq4,:pdq5,:dq1,:dq2,:dq3,:dq4,:dq5,:dq6,:dq7,:dq8,:dq9,:dq10,:dq11,:dq12,:uq1,:uq2,:uq3,:uq4,
    :vq1,:vq2,:vq3,:vq4,:vq5,:gttq1,:gttq2,:gttq3,:gttq4,:gttq5,:gttq6,:gttq7,:gttq8,:gttq9
    
    def marks_a
      pbq1+pbq2+pbq3+pbq4+pdq1+pdq2+pdq3+pdq4+pdq5
    end
    def total_a
      9*5
    end  
    def marks_b
      dq1+dq2+dq3+dq4+dq5+dq6+dq7+dq8+dq9+dq10+dq11+dq12
    end
    def total_b
     12*5
    end
    
    def marks_c
      uq1+uq2+uq3+uq4
    end
    def total_c
      4*5
    end
    
    def marks_d
      vq1+vq2+vq3+vq4+vq5
    end
    def total_d
      5*5
    end
    
    def marks_e
      gttq1+gttq2+gttq3+gttq4+gttq5+gttq6+gttq7+gttq8+gttq9
    end  
    def total_e
      9*5
    end
    
    def self.total_for_grade(a,b,c,d,e)
      total_score = a.to_f+b.to_f+c.to_f+d.to_f+e.to_f
      return "A" if total_score >= 85 && total_score <=100
      return "B" if total_score >=70 && total_score <=84
      return "C" if total_score >=50 && total_score <=69
      return "D" if total_score >=40 && total_score <=49
      return "E" if total_score <40
    end
    
    def self.percentage(y,x,part)
      return y.to_f/x*25 if part=="A"
      return y.to_f/x*30 if part=="B"
      return y.to_f/x*5 if part=="C"
      return y.to_f/x*20 if part=="D"
      return y.to_f/x*20 if part=="E"
    end
    
    #coded list for delivery type
    DELIVERY_TYPE = [
      #Display      #Stored in db 
      ["Teori",           1 ],
      ["Praktikal",       2 ],
      ["Lain-lain",       3 ]
      
    ]
    
end
