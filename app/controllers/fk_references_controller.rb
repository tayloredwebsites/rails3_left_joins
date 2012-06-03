
class FkReferencesController < ApplicationController

	before_filter do |controller|
		@lookups = Lookup.all
	end

  # GET /fk_references
  # GET /fk_references.json
  def index
    @fk_references = FkReference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fk_references }
    end
  end

  # GET /fk_references/1
  # GET /fk_references/1.json
  def show
    @fk_reference = FkReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fk_reference }
    end
  end

  # GET /fk_references/new
  # GET /fk_references/new.json
  def new
    @fk_reference = FkReference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fk_reference }
    end
  end

  # GET /fk_references/1/edit
  def edit
    @fk_reference = FkReference.find(params[:id])
  end

  # POST /fk_references
  # POST /fk_references.json
  def create
    @fk_reference = FkReference.new(params[:fk_reference])

    respond_to do |format|
      if @fk_reference.save
        format.html { redirect_to @fk_reference, notice: 'Fk reference was successfully created.' }
        format.json { render json: @fk_reference, status: :created, location: @fk_reference }
      else
        format.html { render action: "new" }
        format.json { render json: @fk_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fk_references/1
  # PUT /fk_references/1.json
  def update
    @fk_reference = FkReference.find(params[:id])

    respond_to do |format|
      if @fk_reference.update_attributes(params[:fk_reference])
        format.html { redirect_to @fk_reference, notice: 'Fk reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fk_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fk_references/1
  # DELETE /fk_references/1.json
  def destroy
    @fk_reference = FkReference.find(params[:id])
    @fk_reference.destroy

    respond_to do |format|
      format.html { redirect_to fk_references_url }
      format.json { head :no_content }
    end
  end
end
