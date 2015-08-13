class CreatePersonCategories < ActiveRecord::Migration
  def change
    create_table :person_categories do |t|
      t.string :name, null: false
      t.integer :relationship_distance, null: false

      t.timestamps
    end
  end
end
