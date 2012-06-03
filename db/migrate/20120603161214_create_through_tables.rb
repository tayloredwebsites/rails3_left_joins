class CreateThroughTables < ActiveRecord::Migration
  def change
    create_table :through_tables do |t|
      t.references :through_reference
      t.references :lookup
      t.string :description

      t.timestamps
    end
    add_index :through_tables, :through_reference_id
    add_index :through_tables, :lookup_id
  end
end
