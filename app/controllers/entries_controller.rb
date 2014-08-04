class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    #@blog = Blog.find(params[:blog_id])
    #@entry =  @blog.entries.new
    blog = Blog.find(params[:blog_id])
    @entry = Entry.new
    @entry.blog = blog
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    #@blog = Blog.find(params[:blog_id])
    #@entry =  @blog.entries.new(params[:entry_params])
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        #format.html { redirect_to blog_path(@blog), notice: 'entry was successfully created.' }
        format.html { redirect_to blog_entry_path(@entry.blog_id, @entry.id), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
    
  
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @blog = Blog.find(params[:blog_id])
    @entry =  @blog.entries.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to blog_path(@blog), notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body, :blog_id)
    end
end

