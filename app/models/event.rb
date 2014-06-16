class Event < ActiveRecord::Base
  
  belongs_to :staff, :foreign_key => 'createdby'
  
  validates_presence_of :eventname, :location, :eventstdt
  # validates_format_of   :participants, :officiated
  #                      :with => /^[a-zA-Z'` ]+$/, :message => "contains illegal characters"
  
  
 # before_save  :titleize_eventname

 # def titleize_eventname
 #   self.eventname = eventname.titleize
 # end
  
  
  def self.search(search)
      if search
        find(:all, :conditions => ['eventname ILIKE ? or location ILIKE ?', "%#{search}%","%#{search}%"])
     else
      find(:all)
     end
   end
   
   def today
     if (eventstdt - Time.now.end_of_day) * (Time.now.beginning_of_day - eventendt) >= 0
       true
     end
   end
  
end
