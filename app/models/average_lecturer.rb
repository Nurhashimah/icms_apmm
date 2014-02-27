class AverageLecturer < ActiveRecord::Base
    
    require 'decimal' #20Feb2013-use of gem : ruby-decimal-0.2.2 --> in partial _analysis_details.html.erb
before_save :set_subject_id
after_save :update_evaluate_lecturer  
  
has_many :evaluations, :class_name => 'EvaluateLecturer'
belongs_to :principal,     :class_name => 'Staff',     :foreign_key => 'principal_id'
belongs_to :subjectavg,      :class_name => 'Subject',   :foreign_key => 'subject_id'

validates_presence_of :lecturer_id #,:programme_id, :subject_id   #20Feb2013 - compulsory - in order to worls well with print page
#==lecturer-id refers to evaluate_lecturer_id -> UNIQUE (first record) combination of staff_id, course_id & subject_id
#20Feb2013-
def self.find_evaluations(staff,subject)
  EvaluateLecturer.find(:all, :conditions => ['staff_id=? AND subject_id=?', staff, subject])
end

def self.find_average(staff,subject,itemno)
  @evaluation_results = AverageLecturer.find_evaluations(staff,subject)    #EvaluateLecturer.find(:all, :conditions => ['staff_id=? AND subject_id=?', staff, subject])
  @result_ev=[]
  @evaluation_results.each do |evaluation_result|
   	 if itemno==1
   	   @result_ev << evaluation_result.ev_obj 
   	 elsif itemno==2
   	   @result_ev << evaluation_result.ev_knowledge 
   	 elsif itemno==3
   	   @result_ev << evaluation_result.ev_deliver 
   	 elsif itemno==4
   	   @result_ev << evaluation_result.ev_content 
   	 elsif itemno==5
   	   @result_ev << evaluation_result.ev_tool 
   	 elsif itemno==6
       @result_ev << evaluation_result.ev_topic 
     elsif itemno==7   
   	   @result_ev << evaluation_result.ev_work 
   	 elsif itemno==8 
   	   @result_ev << evaluation_result.ev_note 
   	 end 	 
  end 
  aa=@result_ev.inject{|sum, element| sum + element}.to_f/@result_ev.size 
  return Decimal(aa.to_s).round
end
#20Feb2013-

def set_subject_id
  unless lecturer_id.nil?
    self.subject_id = EvaluateLecturer.find(lecturer_id).subject_id
    self.programme_id = EvaluateLecturer.find(lecturer_id).programme_id
  end 
end 

def update_evaluate_lecturer
  if self.id 
    @evaluation = EvaluateLecturer.find(lecturer_id)
    @courseid = @evaluation.course_id
    @staffid = @evaluation.staff_id
    @subjectid = @evaluation.subject_id
    @evaluations = EvaluateLecturer.find(:all, :conditions=>['course_id=? AND staff_id=? AND subject_id=?', @courseid, @staffid, @subjectid])
    @evaluations.each do |evaluation|
      evaluation.average_lecturer_id = self.id
      evaluation.save
    end
  end 
end

CATEGORY = [
    #  Displayed       stored in db
    [ "Layak",             "1" ],
    [ "Tidak Layak",      "2" ]
  ]
end
