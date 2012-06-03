class CreateThroughReferences < ActiveRecord::Migration
  def change
    create_table :through_references do |t|
      t.string :description

      t.timestamps
    end
  end
end
