
class ThroughTablesController < ApplicationController
  # GET /through_tables
  # GET /through_tables.json
  def index
    @through_tables = ThroughTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @through_tables }
    end
  end

  # GET /through_tables/1
  # GET /through_tables/1.json
  def show
    @through_table = ThroughTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @through_table }
    end
  end

  # GET /through_tables/new
  # GET /through_tables/new.json
  def new
    @through_table = ThroughTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @through_table }
    end
  end

  # GET /through_tables/1/edit
  def edit
    @through_table = ThroughTable.find(params[:id])
  end

  # POST /through_tables
  # POST /through_tables.json
  def create
    @through_table = ThroughTable.new(params[:through_table])

    respond_to do |format|
      if @through_table.save
        format.html { redirect_to @through_table, notice: 'Through table was successfully created.' }
        format.json { render json: @through_table, status: :created, location: @through_table }
      else
        format.html { render action: "new" }
        format.json { render json: @through_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /through_tables/1
  # PUT /through_tables/1.json
  def update
    @through_table = ThroughTable.find(params[:id])

    respond_to do |format|
      if @through_table.update_attributes(params[:through_table])
        format.html { redirect_to @through_table, notice: 'Through table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @through_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /through_tables/1
  # DELETE /through_tables/1.json
  def destroy
    @through_table = ThroughTable.find(params[:id])
    @through_table.destroy

    respond_to do |format|
      format.html { redirect_to through_tables_url }
      format.json { head :no_content }
    end
  end
end
