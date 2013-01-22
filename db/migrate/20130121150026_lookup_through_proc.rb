class LookupThroughProc < ActiveRecord::Migration
  def up
    execute <<-SQL
      -- Function: lookup_through_proc(integer)
      CREATE OR REPLACE FUNCTION lookup_through_proc(IN reference_id integer)
        RETURNS TABLE(through_references_id integer, through_references_description character varying, id integer, name character varying, value character varying, created_at timestamp without time zone, updated_at timestamp without time zone) AS
        $BODY$
          SELECT through_references.id, through_references.description, lookups.*
            FROM lookups
            LEFT OUTER JOIN through_tables ON (through_tables.lookup_id = lookups.id AND through_tables.through_reference_id = $1)
            LEFT OUTER JOIN through_references ON through_references.id = through_tables.through_reference_id
            ORDER BY lookups.name;
        $BODY$
        LANGUAGE sql VOLATILE
        COST 100
        ROWS 100;
      ALTER FUNCTION lookup_through_proc(integer)
        OWNER TO "RoR";
    SQL
  end

  def down
    execute <<-SQL
      DROP FUNCTION lookup_through_proc(integer);
    SQL
  end
end
