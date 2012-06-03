class CreateFkReferences < ActiveRecord::Migration
  def change
    create_table :fk_references do |t|
      t.references :lookup
      t.string :description

      t.timestamps
    end
    add_index :fk_references, :lookup_id
  end
end
