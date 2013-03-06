class Leaveforstaff < ActiveRecord::Base

  before_save :save_my_approvers
  
  belongs_to :applicant,    :class_name => 'Staff', :foreign_key => 'staff_id'
  belongs_to :replacement,  :class_name => 'Staff', :foreign_key => 'replacement_id'
  belongs_to :seconder,     :class_name => 'Staff', :foreign_key => 'approval1_id'
  belongs_to :approver,     :class_name => 'Staff', :foreign_key => 'approval2_id'
  
  validates_presence_of :staff_id, :leavetype, :submit
  
  named_scope :mine,        :conditions =>  ["staff_id=?", User.current_user.staff_id]
  named_scope :forsupport,  :conditions =>  ["approval1_id=? AND approval1 IS ?", User.current_user.staff_id, nil]
  named_scope :forapprove,  :conditions =>  ["approval2_id=? AND approver2 IS ? AND approval1=?", User.current_user.staff_id, nil, true]
  named_scope :rest,      :conditions => { :leavetype => 1 }
  named_scope :sick,    :conditions => { :leavetype => 2 }
  named_scope :norecord,   :conditions => { :leavetype => 3 }
  named_scope :halfsalary,   :conditions => { :leavetype => 4 }
  named_scope :nosalary,   :conditions => { :leavetype => 5 }
  named_scope :maternity,   :conditions => { :leavetype => 6 }
  named_scope :haji,   :conditions => { :leavetype => 7 }
  named_scope :fourhour,   :conditions => { :leavetype => 8 }
  named_scope :offduty,   :conditions => { :leavetype => 9 }
   


  FILTERS = [
    {:scope => "all",        :label => "All"},
    {:scope => "mine",       :label => "My Leave"},
    {:scope => "forsupport", :label => "For My Support"},
    {:scope => "forapprove", :label => "For My Approval"},
	  {:scope => "rest", :label => "Cuti Rehat"},
	  {:scope => "sick", :label => "Cuti Sakit"},
	  {:scope => "norecord", :label => "Cuti Tanpa Record"},
	  {:scope => "halfsalary", :label => "Cuti Separuh Gaji"},
	  {:scope => "nosalary", :label => "Cuti Tanpa Gaji"},
	  {:scope => "maternity", :label => "Cuti Bersalin"},
	  {:scope => "haji", :label => "Cuti Haji"},
	  {:scope => "fourhour", :label => "Pelepasan 4 Jam"},
	  {:scope => "offduty", :label => "Off Duty"}
	
    ]


  
  def self.find_main
    Staff.find(:all, :condition => ['staff_id IS NULL'])
  end
  
  def save_my_approvers
		self.approval1_id = applicant.position.bosses.staff_id
		self.approval2_id = applicant.position.bosses.bosses.staff_id
  end
  
  def apply_leave_status
    if approval1 == nil
      "Awaiting for Endorsed"
    elsif approval1 == false || approver2 == false 
      "Rejected"
    elsif approval1 == true && approver2 == nil
      "Endorsed by 1st Approval, Awaiting 2nd Approval"
    elsif approval1 == true && approver2 == true
      " All Approvals Complete"
    else
      "No Status available"
    end
  end
  
  def leave_for
    if leavenddate == 'null' || leavestartdate == 'null' || (leavenddate - leavestartdate) == 0
      1
    else
      ((leavenddate - leavestartdate).to_i) + 1
    end
  end
  
  def show_to_day
    if (leavenddate - leavestartdate) == 0
      ""
    else
      "  " + (leavenddate.strftime("%d %b %Y")).to_s
    end
  end
  

  def cuti_rehat_entitlement
     getdata = applicant.staffgrade.name
       if getdata == nil
         a = 0
       else
        a = (applicant.staffgrade.name)[-2,4].to_i
       end
     b = Date.today.year - applicant.appointdt.year
     if a < 21 && b < 10
       20
     elsif a < 21 && b > 10
       25
     elsif a < 31 && b < 10
       25
     elsif a < 31 && b > 10
       30
     elsif a > 30 && b < 10
       30
     else
       35
     end
   end
  
  def applicant_details 
       suid = staff_id.to_a
       exists = Staff.find(:all, :select => "id").map(&:id)
       checker = suid & exists     
   
       if staff_id == nil
          "" 
        elsif checker == []
          "Staff No Longer Exists" 
       else
         applicant.staff_name_with_title
       end
  end
  
  def endorser_details 
       suid = approval1_id.to_a
       exists = Staff.find(:all, :select => "id").map(&:id)
       checker = suid & exists     
   
       if approval1_id == nil
          "" 
        elsif checker == []
          "Staff No Longer Exists" 
       else
         seconder.staff_name_with_title
       end
  end
  
  def replacement_details 
       suid = replacement_id.to_a
       exists = Staff.find(:all, :select => "id").map(&:id)
       checker = suid & exists     
   
       if replacement_id == nil
          "" 
        elsif checker == []
          "Staff No Longer Exists" 
       else
         replacement.staff_name_with_title
       end
  end
  
  
STAFFLEAVETYPE = [
         #  Displayed       stored in db
         [ "Cuti Rehat",1 ],
         [ "Cuti Sakit",2],
         [ "Cuti Tanpa Rekod",3 ],
         [ "Cuti Separuh Gaji",4 ],
         [ "Cuti Tanpa Gaji",5 ],
         [ "Cuti Bersalin",6 ],
         [ "Cuti Haji",7 ],
         [ "Pelepasan 4 Jam",8 ],
         [ "Off Duty",9 ] #7/12/2011 - Shaliza added leave type
 ]
 
 #---------------Search--------------------------------------------------------------------------------

   def self.search(search)
      if search
       @leaveforstaff = Leaveforstaff.find(:all, :conditions => ['leavestartdate >= ?',@date])
      else
       @leaveforstaff = Leaveforstaff.find(:all)
      end
   end
end
