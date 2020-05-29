class CreateProductPersonMaps < ActiveRecord::Migration
  def change
    create_table :product_person_maps do |t|
      t.references :product, index: true, null: false
      t.references :person, index: true, null: false
      t.integer :rank, null: false

      t.timestamps
    end
  end
end
