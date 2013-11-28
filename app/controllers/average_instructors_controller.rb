class AverageInstructorsController < ApplicationController
  # GET /average_instructors
  # GET /average_instructors.xml
  def index
    @average_instructors = AverageInstructor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @average_instructors }
    end
  end

  # GET /average_instructors/1
  # GET /average_instructors/1.xml
  def show
    @average_instructor = AverageInstructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @average_instructor }
    end
  end

  # GET /average_instructors/new
  # GET /average_instructors/new.xml
  def new
    @average_instructor = AverageInstructor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @average_instructor }
    end
  end

  # GET /average_instructors/1/edit
  def edit
    @average_instructor = AverageInstructor.find(params[:id])
  end

  # POST /average_instructors
  # POST /average_instructors.xml
  def create
    @average_instructor = AverageInstructor.new(params[:average_instructor])

    respond_to do |format|
      if @average_instructor.save
        flash[:notice] = 'AverageInstructor was successfully created.'
        format.html { redirect_to(@average_instructor) }
        format.xml  { render :xml => @average_instructor, :status => :created, :location => @average_instructor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @average_instructor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /average_instructors/1
  # PUT /average_instructors/1.xml
  def update
    #raise params.inspect  #endtime(6i)
    @average_instructor = AverageInstructor.find(params[:id])
@average_instructor.endtime
    respond_to do |format|
      if @average_instructor.update_attributes(params[:average_instructor])
        flash[:notice] = 'AverageInstructor was successfully updated.'+@average_instructor.endtime.to_s
        format.html { redirect_to(@average_instructor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @average_instructor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /average_instructors/1
  # DELETE /average_instructors/1.xml
  def destroy
    @average_instructor = AverageInstructor.find(params[:id])
    @average_instructor.destroy

    respond_to do |format|
      format.html { redirect_to(average_instructors_url) }
      format.xml  { head :ok }
    end
  end
  
  #6March 2013-Feature#12
  def average_score_analysis
     @average_instructor = AverageInstructor.find(params[:id])
     render :layout => 'report'
  end
end
