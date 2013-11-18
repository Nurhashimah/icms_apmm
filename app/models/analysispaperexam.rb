class Analysispaperexam < ActiveRecord::Base
  
   #links to Model Programmes
   belongs_to :course_name,    :class_name => 'Programme', :foreign_key => 'course_id'
   has_many :marks, :dependent => :destroy                                                     
   accepts_nested_attributes_for :marks#, :reject_if => lambda { |a| a[:mark].blank? }   #use of validates_presence_of in mark model
   #links to Model Class
   belongs_to :classroom, :class_name => 'Klass', :foreign_key => 'class_id'

   #links to Model Exammaker
   belongs_to :examname, :class_name => 'Exammaker', :foreign_key => 'exam_id'


   attr_accessor :programme_id
   validates_presence_of :student_id, :exam_id, :course_id
   
   def total_marks
   	  if self.id	
         Mark.sum(:mark, :conditions => ["analysispaperexam_id=?", self.id])
       else
         @total_marks	#any input by user will be ignored either edit form or new (including re-submission-invalid data)
   					          #value assigned from partial..(1) single entry(_form.html.erb-line 44-47) (2) multiple entry(_form_by_paper.html.erb-line88-91)
       end
    end
    
    def total_marks2(exam_id,student_id)
     	analisispapaerexam_id = Analysispaperexam.find(:first, :conditions=>['exam_id=? AND student_id=?',exam_id,student_id])
     	Mark.sum(:mark, :conditions => ["analysispaperexam_id=?", analisispapaerexam_id])
    end
   
    def self.set_params_value(exammark_list,datatype_for)
         @count_exammark = 0
         exammark_list.each do |exammarkline|
           if @count_exammark == 0 
     			  if datatype_for == 0
     				   return exammarkline.exam_id.to_i              # working format - @try = gradeline.exam1marks.to_i.to_s
             end
           end
           @count_exammark+=1
         end  
    end
    
    def self.set_error_messages(exammark_list)
   	  @analysispaperexams = []
   	  @analysispaperexams2 = []
   	  @analysispaperexams_full = []
      @errors_qty = 0
      exammark_list.each do |exammarksub|
        exammarksub.errors.each do |key,value|
            @key2 = key
   			    @analysispaperexams << '<b>'+I18n.t('activerecord.attributes.analysispaperexam.'+key)+'</b>'+' '+value+'<br>'
   			    #@analysispaperexams << '<b>'+key+'</b>'+' '+value+'<br>'
   			    @errors_qty+=1
   		  end 
   	  end	
      if @errors_qty == 1
   			  @analysispaperexams2 <<'<b>'+@errors_qty.to_s+' error '
   	  elsif @errors_qty > 1
   			  @analysispaperexams2 <<'<b>'+@errors_qty.to_s+' errors '
   	  end
   	  @analysispaperexams2 << 'prohibited this record from being saved</b><br><br>'
   	  @analysispaperexams_full << @analysispaperexams2.to_s+@analysispaperexams.to_s
       return@analysispaperexams_full
     end
   
end
