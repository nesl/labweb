class CreateDocumentPersonMaps < ActiveRecord::Migration
  def change
    create_table :document_person_maps do |t|
      t.references :document, index: true, null: false
      t.references :person, index: true, null: false
      t.integer :rank, null: false

      t.timestamps
    end
  end
end
