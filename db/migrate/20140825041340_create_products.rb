class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.integer :year, limit: 2
      t.integer :month, limit: 1
      t.string :url
      t.boolean :ispublic, null: false, default: false
      t.boolean :islabproduct, null: false, default: true
      t.hstore :miscattributes
      t.references :product_category, index: true
      t.references :main_research_area, index: true

      t.timestamps
    end
  end
end
