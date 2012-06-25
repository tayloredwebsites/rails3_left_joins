
class LookupsController < ApplicationController
  # GET /lookups
  # GET /lookups.json
  def index
    @lookups = Lookup.all
    @lookup_references = Lookup.includes(:fk_references)
    @lookup_through_tables = Lookup.includes(:through_tables).includes(:through_references).order('lookups.id')
    # @lookup_through_tables = Lookup.includes(:through_tables, :through_references)
    # @lookup_through_tables = Lookup.includes(:through_tables => :through_references)
    @lookup_for_reference_where = Lookup.includes(:through_tables).includes(:through_references).where("through_references.id = 1").order('lookups.id') # does not return lookup.id = 3, and returns a through_references.id = 2 ?????
    @lookup_for_reference_left_join_on_through_table = Lookup.joins("LEFT OUTER JOIN through_tables ON (lookups.id = through_tables.lookup_id AND through_tables.through_reference_id = 1)" ).includes(:through_references).order('lookups.id') # it seems to ignores the AND in the ON clause
    @lookup_for_reference_left_join_on_reference_table = Lookup.joins("LEFT OUTER JOIN through_tables ON lookups.id = through_tables.lookup_id").joins("LEFT OUTER JOIN through_references ON (through_references.id = through_tables.through_reference_id AND through_references.id = 1)" ) # it seems to ignores the AND in the ON clause
    @lookup_for_reference_find_by_sql_through_tables = Lookup.find_by_sql("SELECT * FROM lookups LEFT OUTER JOIN through_tables ON (through_tables.lookup_id = lookups.id AND through_tables.through_reference_id = 1) LEFT OUTER JOIN through_references ON through_references.id = through_tables.through_reference_id ORDER BY lookups.value, through_references.id" )
     @lookup_for_reference_find_by_sql_through_references = Lookup.find_by_sql("SELECT * FROM lookups LEFT OUTER JOIN through_tables ON through_tables.lookup_id = lookups.id LEFT OUTER JOIN through_references ON (through_references.id = through_tables.through_reference_id AND through_references.id = 1) ORDER BY lookups.value, through_references.id" )
     @lookup_for_reference_includes_hash_where = Lookup.includes(:through_tables => :through_reference).where("through_tables.through_reference_id = 1").order('lookups.id') # the where functions like a sql where properly here
     @lookup_reference = Lookup.includes(:through_references).order('lookups.id')
     @lookup_reference_where = Lookup.includes(:through_references).where("through_tables.through_reference_id = 1").order('lookups.id')
     @lookup_through = Lookup.includes(:through_tables).order('lookups.id')
     @lookup_through_where = Lookup.includes(:through_tables).where("through_tables.through_reference_id = 1").order('lookups.id') 
     # @lookup_for_reference_includes_hash_join = Lookup.includes(:through_tables => :through_reference => {:id => 1}).order('lookups.id') # invalid syntax

     Rails.logger.debug ("* LookupsController.index @lookup_for_reference_find_by_sql_through_tables")
     @lookup_for_reference_find_by_sql_through_tables.each do |row|
       Rails.logger.debug ("***** LookupsController.index row = #{row.inspect.to_s}")
       Rails.logger.debug ("***   LookupsController.index through_tables = #{row.through_tables}")
       Rails.logger.debug ("*     LookupsController.index through_references = #{row.through_references}")
     end
     # note sqlite3 only returns the lookups with no joins (missing fields)
     # postgreSQL  returns both lookups with no joins(missing fields), as well as the entire join table

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lookups }
    end
  end

  # GET /lookups/1
  # GET /lookups/1.json
  def show
    @lookup = Lookup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lookup }
    end
  end

  # GET /lookups/new
  # GET /lookups/new.json
  def new
    @lookup = Lookup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lookup }
    end
  end

  # GET /lookups/1/edit
  def edit
    @lookup = Lookup.find(params[:id])
  end

  # POST /lookups
  # POST /lookups.json
  def create
    @lookup = Lookup.new(params[:lookup])

    respond_to do |format|
      if @lookup.save
        format.html { redirect_to @lookup, notice: 'Lookup was successfully created.' }
        format.json { render json: @lookup, status: :created, location: @lookup }
      else
        format.html { render action: "new" }
        format.json { render json: @lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lookups/1
  # PUT /lookups/1.json
  def update
    @lookup = Lookup.find(params[:id])

    respond_to do |format|
      if @lookup.update_attributes(params[:lookup])
        format.html { redirect_to @lookup, notice: 'Lookup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lookups/1
  # DELETE /lookups/1.json
  def destroy
    @lookup = Lookup.find(params[:id])
    @lookup.destroy

    respond_to do |format|
      format.html { redirect_to lookups_url }
      format.json { head :no_content }
    end
  end
end
