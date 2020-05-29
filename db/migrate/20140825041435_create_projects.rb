class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :description
      t.boolean :isactive, null: false, default: true
      t.string :url
      t.hstore :miscattributes
      t.references :main_research_area, index: true

      t.timestamps
    end
  end
end
