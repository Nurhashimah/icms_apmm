class Ptschedule < ActiveRecord::Base

  before_save :varmyass
  belongs_to :ptcourse
  validates_presence_of :branch, :coursename
  has_many :ptdos
  
  def bil
      v=1
   end
   
  DUR_TYPE = [
       #  Displayed       stored in db
       [ "Hours", 1 ],
       [ "Days",  8 ]
  ]
  
  
  
  def varmyass
  self.total_speaker = speaker_calc
	self.total_meal = meal_calc
	self.big_total = total_course_value
#	self.total_speaker_hour = rate_speaker_byhour
  end
  
  def total_course_value
    speaker_calc + meal_calc
  end
  
  def speaker_calc
    if rate_speaker == 8
      speaker_unit_rate * (course_duration_hours/8)
    else
      speaker_unit_rate * course_duration_hours
    end
  end
  
  def meal_calc
	  (meals * min_participants) * duration_in_course_days
  end
  
  def duration_in_course_days
    if ((course_duration_hours)/8) < 1
      1
    else 
      (course_duration_hours)/8
    end
  end
  
  def speaker_unit_rate
    if allowance_speaker == nil || allowance_speaker == 0
      0
    else
      allowance_speaker
    end
  end
  
  def course_duration_hours
    duration * duration_type
  end
    
    
    
def course_name
    suid = ptcourse_id.to_a
    suexists = Ptcourse.find(:all, :select => "id").map(&:id)
    filechecker = suid & suexists

    if ptcourse_id == nil
          ""
    elsif filechecker == []
          "Course No Longer Exists"
    else
          ptcourse.name 
    end 
end

def course_desc
    suid = ptcourse_id.to_a
    suexists = Ptcourse.find(:all, :select => "id").map(&:id)
    filechecker = suid & suexists

    if ptcourse_id == nil
          ""
    elsif filechecker == []
          "-"
    else
          ptcourse.description 
    end 
end

def course_duration
    suid = ptcourse_id.to_a
    suexists = Ptcourse.find(:all, :select => "id").map(&:id)
    filechecker = suid & suexists

    if ptcourse_id == nil
          ""
    elsif filechecker == []
          "-"
    else
          ptcourse.duration 
    end 
end

def course_duration_type
    suid = ptcourse_id.to_a
    suexists = Ptcourse.find(:all, :select => "id").map(&:id)
    filechecker = suid & suexists

    if ptcourse_id == nil
          ""
    elsif filechecker == []
          "-"
    else
          ptcourse.rendered_course_duration 
    end 
end

def course_type
    suid = ptcourse_id.to_a
    suexists = Ptcourse.find(:all, :select => "id").map(&:id)
    filechecker = suid & suexists

    if ptcourse_id == nil
          ""
    elsif filechecker == []
          "-"
    else
          ptcourse.rendered_course_type 
    end 
end

def trainer_course
    suid = ptcourse_id.to_a
    suexists = Ptcourse.find(:all, :select => "id").map(&:id)
    filechecker = suid & suexists

    if ptcourse_id == nil
          ""
    elsif filechecker == []
          "-"
    else
          ptcourse.trainer_name
    end 
end
end
