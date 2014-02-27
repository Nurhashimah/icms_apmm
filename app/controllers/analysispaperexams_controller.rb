class AnalysispaperexamsController < ApplicationController
  # GET /analysispaperexams
  # GET /analysispaperexams.xml
  def index
    @analysispaperexams = Analysispaperexam.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @analysispaperexams }
    end
  end

  # GET /analysispaperexams/1
  # GET /analysispaperexams/1.xml
  def show
    @analysispaperexam = Analysispaperexam.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @analysispaperexam }
    end
  end

  # GET /analysispaperexams/new
  # GET /analysispaperexams/new.xml
  def new
    @new_type = params[:new_type]                                                       
    if @new_type && @new_type == "1"      # for multiple entry
    	@exam_id = params[:examid]
    	unless @exam_id.blank? || @exam_id.nil? || @exam_id == 0 || @exam_id == '0'
    	  @examquestions = Exammaker.find(@exam_id).examquestions
    		@selected_subject = Exammaker.find(@exam_id).subject_id
    		#@students = Student.available_students2(@selected_subject)     #refer  - action : view_students_programme (for NEW record only)
        @students_qty = @students.count
    		@analysispaperexams = Array.new(@students_qty) { Exammark.new } #(params[:exammarks])
    		@analysispaperexams.each do |analysispaperexam|                 # have to build nested attribute, mark(formative) inside of each item of grade array
    			analysispaperexam.marks.build          
    		end
    	end     #end for unless..

    	#@klass_of_subject = Klass.find(:first, :conditions=> ['subject_id=?',@selected_subject])
    	#unless @klass_of_subject.blank? || @klass_of_subject.nil?
    	#@students_selected_subject = @klass_of_subject.students
    	#@students_qty = @students_selected_subject.count

    #elsif @new_type && @new_type =="0"    # for single entry
    	#@analysispaperexams = Analysispaperexam.new(params[:analysispaperexam]) 
      #@analysispaperexam.marks.build

      #respond_to do |format|
        #format.html # new.html.erb
        #format.xml  { render :xml => @analysispaperexam }
      #end

    elsif @new_type && @new_type == "2"      
      #-----start-for multiple new entry-filter by programme----12 Sept 2012-----
      @analysispaperexams = Array.new(5) { Analysispaperexam.new } 	                  #(params[:exammarks])
    	@analysispaperexams.each do |analysispaperexam|                                 # have to build nested attribute, mark(formative) inside of each item of grade array
    		analysispaperexam.marks.build          
    	end
      #-----end-for multiple new entry-filter by programme----12 Sept 2012-------
    end  
  end

  # GET /analysispaperexams/1/edit
  def edit
    @edit_type = params[:edit_type]  
    if @edit_type && @edit_type == "2"  
      @analysispaperexam = Analysispaperexam.find(params[:id])     
      @course_id = @analysispaperexam.course_id
      @exam_id = @analysispaperexam.exam_id      
      unless @exam_id.blank? || @exam_id.nil? 
        @examquestions = Exammaker.find(@exam_id).examquestions
        @subject = Exammaker.find(@exam_id).subject_id
        @students_ids = Student.available_students2(@subject).map(&:id)   
        @exist_analysis_students2 = Analysispaperexam.find(:all, :conditions =>['student_id IN (?) AND course_id=? AND exam_id=?',@students_ids,@course_id,@exam_id]).map(&:student_id)
        @students = Student.find(:all, :conditions => ['id IN (?)', @exist_analysis_students2])
        #@students = Student.available_students2(@subject) 
      end
    end 
  end

  # POST /analysispaperexams
  # POST /analysispaperexams.xml
  def create
    @create_type = params[:new_submit]                                            # retrieve - parameter sent via submit button

    if @create_type == "Create By Paper"                                       # create multiple records 
      @new_type = "2"
      @analysispaperexam_all = params[:analysispaperexams]  
      @analysispaperexams = params[:analysispaperexams].values.collect { |analysispaperexam| Analysispaperexam.new(analysispaperexam) }

    	#---start-retrieve params value of entered data by user - for action:new usage --> when errors arrise & requires re-submission of form 
    	#@analysispaperexam_id = Analysispaperexam.set_params_value(@analysispaperexams,0)
    	#@selected_subject = Analysispaperexam.find(@analysispaperexam_id).subject_id
    	#@examquestions = Analysispaperexam.find(@analysispaperexam_id).examquestions
    	#@students = Student.available_students2(@selected_subject) 
    	#@students_qty = @students.count
    	#----end-retrieve params value of entered data by user - for action:new usage --> when errors arrise & requires re-submission of form 

    	#---this part will assign & save total marks (of exammaker[exam paper]) taken directly to grade table - field exam1marks)
      #@all_analysispaperexams = params[:analysispaperexams]
      #Analysispaperexam.update_multiple_exam1mark_in_grades(@analysispaperexam_id,@all_analysispaperexams,@selected_subject,@students)
      #---where exam1marks field (grade table) loaded with total marks & saved in db-------------------------------------------

      if @analysispaperexams.all?(&:valid?) 
        @analysispaperexams.each(&:save!)     # ref: to retrieve each value of @exammarks --> http://railsforum.com/viewtopic.php?id=11557 (Dazen2 007-10-07 05:27:42) 
        flash[:notice] = 'Successfully saved all records'#+@analysispaperexam_all.to_s+"lolololo"+@analysispaperexams.to_s
        redirect_to :action => 'index'
      else                                                                      
    		@analysispaperexamerrormsg = Analysispaperexam.set_error_messages(@analysispaperexams) 
    		flash[:error] = @analysispaperexamerrormsg	#red box                              
        flash[:notice] = 'Data supplied was invalid. Please insert all data accordingly. All fields are compulsory.'
        render :action => 'new'
        flash.discard
      end

    #elsif @create_type == "Create"                                                # create one record
      #@new_type ="0"

      #---this part will assign & save total marks (of exammaker[exam paper]) taken directly to grade table - field exam1marks)
      #@analysispaperexam_id = params[:analysispaperexam][:analysispaperexam_id]
      #@student_id = params[:analysispaperexam][:student_id]
      #@all_marks= params[:analysispaperexam][:marks_attributes]
      #Analysispaperexam.update_single_exam1mark_in_grades(@analysispaperexam_id,@student_id,@all_marks)
      #---exam1marks field (grade table) loaded with total marks & saved in db-------------------------------------------------

      #@analysispaperexam = Analysispaperexam.new(params[:analysispaperexam])
      #@exammark_all = params[:analysispaperexam]  

      #respond_to do |format|
        #if @analysispaperexam.save
          #format.html { redirect_to(@analysispaperexam, :notice => 'Analysispaperexam was successfully created.') }
          #format.xml  { render :xml => @analysispaperexam, :status => :created, :location => @analysispaperexam }
        #else
          #format.html { render :action => "new" }
          #format.xml  { render :xml => @analysispaperexam.errors, :status => :unprocessable_entity }
        #end
      #end
    end
  end

  # PUT /analysispaperexams/1
  # PUT /analysispaperexams/1.xml
  def update
    @total_marks_set = params[:analysispaperexams].size
    @allmarks=[]
    @allmarks2=[]
    @student=[]
    @examid=params[:analysispaperexams]['0'][:exam_id]
    0.upto(@total_marks_set.to_i-1) do |count|
        @student[count]=params[:analysispaperexams][count.to_s][:student_id]
        @allmarks2[count]= params[:analysispaperexams][count.to_s]
        @analysispaperexam =  Analysispaperexam.find(:first, :conditions=>['exam_id=? AND student_id=?',@examid, @student[count]])
        @analysispaperexam.update_attributes(@allmarks2[count])
    end   
    flash[:notice] = "Updated exammarks!"
    redirect_to :action => 'index'    
  end

  # DELETE /analysispaperexams/1
  # DELETE /analysispaperexams/1.xml
  def destroy
    @analysispaperexam = Analysispaperexam.find(params[:id])
    @analysispaperexam.destroy
    respond_to do |format|
      format.html { redirect_to(analysispaperexams_url) }
      format.xml  { head :ok }
    end
  end
  
  def view_subject
    @course_id = params[:programmeid]
    @index = params[:index]  
    unless @course_id.blank?
      @programme_subjects = Programme.find(:all, :include=> :subjects, :conditions=>['id=?',@course_id])
  		@analysispaperexam_of_programme = []
  		@analysispaperexam_items = []
  		@exist_analysis = Analysispaperexam.all.count
  	  @programme_subjects.each do |prog| 
  		  prog.subjects.each do |prog_subject| 
  		    if @exist_analysis==0
  				  @analysispaperexam_of_programme << Exammaker.find(:all, :conditions => ['subject_id=?', prog_subject.id])
  			  else
  			    @analysispaperexam_of_programme << Exammaker.find(:all, :conditions => ['subject_id=? AND id NOT IN(?)', prog_subject.id, Analysispaperexam.all.map(&:exam_id)])
  		    end
  			end
  		end
  		@analysispaperexam_of_programme.each do |analysispaperexam|
  		  analysispaperexam.each do |exam|
  		    @analysispaperexam_items << exam
  		  end 
  		end
    end
    render :partial => 'included_subject_exammarks', :layout => false   
	end
  
  def view_students_programme
    @exam_id = params[:examid]    #Refers to label:subject 
    @course_id = params[:programmeid]
    unless @exam_id.blank? || @exam_id.nil? 
      @examquestions = Exammaker.find(@exam_id).examquestions
      @subject = Exammaker.find(@exam_id).subject_id
      #for NEW record only--
      unless @analysispaperexam && !@analysispaperexam.id.nil?   
        @students = Student.available_students2(@subject)   
        @students_ids = Student.available_students2(@subject).map(&:id)   
        @exist_analysis_students_of_same_subject = Analysispaperexam.find(:all, :joins=> :examname, :conditions =>['student_id IN (?) AND subject_id=?',@students_ids,@subject]).map(&:student_id)
        @students = Student.find(:all, :conditions => ['id IN (?) AND id NOT IN (?)', @students_ids, @exist_analysis_students_of_same_subject])
      end
    end
  	render :partial => 'student_listing2', :layout => false
  end
  
end
