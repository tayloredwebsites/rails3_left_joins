class ViewLookupItems < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE VIEW view_lookup_items AS
        SELECT through_references.id as through_references_id, through_references.description as through_references_description, lookups.*
          FROM lookups
          LEFT OUTER JOIN through_tables ON through_tables.lookup_id = lookups.id AND through_tables.through_reference_id = 1
          LEFT OUTER JOIN through_references ON through_references.id = through_tables.through_reference_id
          ORDER BY lookups.name
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW view_lookup_items
    SQL
  end
end
