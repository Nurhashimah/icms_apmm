class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
  def index
    @books = Book.search(params[:search])#.paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new
   @book.accessions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def help 
     @books = Book.search(params[:all])
     @books = Book.find(:all)
  end
  
  def rules 
     @books = Book.search(params[:all])
     @books = Book.find(:all)
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.destroy
        format.html { redirect_to(books_url) }
        format.xml  { head :ok }
        
      else
        flash[:error] = 'Deletion of selected book is not allowed due to existing library transaction record.'
        format.html { redirect_to(books_url) }
        format.xml  { head :ok }
      end
    end
    
    end
end
