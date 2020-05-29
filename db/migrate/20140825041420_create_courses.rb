class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :department, null: false
      t.string :number, null: false
      t.string :title, null: false
      t.text :description
      t.string :url
      t.string :crosslistings

      t.timestamps
    end
  end
end
