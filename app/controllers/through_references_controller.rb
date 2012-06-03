
class ThroughReferencesController < ApplicationController
  # GET /through_references
  # GET /through_references.json
  def index
    @through_references = ThroughReference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @through_references }
    end
  end

  # GET /through_references/1
  # GET /through_references/1.json
  def show
    @through_reference = ThroughReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @through_reference }
    end
  end

  # GET /through_references/new
  # GET /through_references/new.json
  def new
    @through_reference = ThroughReference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @through_reference }
    end
  end

  # GET /through_references/1/edit
  def edit
    @through_reference = ThroughReference.find(params[:id])
  end

  # POST /through_references
  # POST /through_references.json
  def create
    @through_reference = ThroughReference.new(params[:through_reference])

    respond_to do |format|
      if @through_reference.save
        format.html { redirect_to @through_reference, notice: 'Through reference was successfully created.' }
        format.json { render json: @through_reference, status: :created, location: @through_reference }
      else
        format.html { render action: "new" }
        format.json { render json: @through_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /through_references/1
  # PUT /through_references/1.json
  def update
    @through_reference = ThroughReference.find(params[:id])

    respond_to do |format|
      if @through_reference.update_attributes(params[:through_reference])
        format.html { redirect_to @through_reference, notice: 'Through reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @through_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /through_references/1
  # DELETE /through_references/1.json
  def destroy
    @through_reference = ThroughReference.find(params[:id])
    @through_reference.destroy

    respond_to do |format|
      format.html { redirect_to through_references_url }
      format.json { head :no_content }
    end
  end
end
