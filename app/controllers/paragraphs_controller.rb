class ParagraphsController < ApplicationController
  # GET /paragraphs
  # GET /paragraphs.json
  def index
    @paragraphs = Paragraph.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paragraphs }
    end
  end

  # GET /paragraphs/1
  # GET /paragraphs/1.json
  def show
    @paragraph = Paragraph.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paragraph }
    end
  end

  # GET /paragraphs/new
  # GET /paragraphs/new.json
  def new 
    @paragraph = Paragraph.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paragraph }
    end 
  end

  def append
    begin
      Paragraph.transaction do
        prevParagraph = Paragraph.find(params[:id])
        
        @paragraph = Paragraph.new
        @paragraph.prev = prevParagraph
      
        prevParagraph.next = @paragraph
        
        @paragraph.save!
        prevParagraph.save!  
      end
    rescue ActiveRecord::RecordInvalid => invalid
      respond_to do |format|
        format.html { render action: "append" }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully created.' }
        format.json { render json: @paragraph, status: :created, location: @paragraph }   
      end 
    end
    
  end
  
  # GET /paragraphs/1/edit
  def edit
    @paragraph = Paragraph.find(params[:id])
  end

  # POST /paragraphs
  # POST /paragraphs.json
  def create
    @paragraph = Paragraph.new(params[:paragraph])

    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully created.' }
        format.json { render json: @paragraph, status: :created, location: @paragraph }
      else
        format.html { render action: "new" }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paragraphs/1
  # PUT /paragraphs/1.json
  def update
    @paragraph = Paragraph.find(params[:id])

    respond_to do |format|
      if @paragraph.update_attributes(params[:paragraph])
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paragraphs/1
  # DELETE /paragraphs/1.json
  def destroy


    begin
      Paragraph.transaction do
        @paragraph = Paragraph.find(params[:id])
        
        unless @paragraph.next.nil? or @paragraph.prev.nil?
          prev_paragraph = @paragraph.prev
          next_paragraph = @paragraph.next
          
          prev_paragraph.next = next_paragraph
          next_paragraph.prev = prev_paragraph
          
          prev_paragraph.save!
          next_paragraph.save!
        end
        
        @paragraph.destroy
      end
    rescue ActiveRecord::RecordInvalid => invalid
      respond_to do |format|
        format.html { redirect_to paragraphs_url  }
        format.json { render head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to paragraphs_url }
        format.json { head :no_content }
      end
    end

  end
end
