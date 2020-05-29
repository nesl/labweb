class CreateCourseOfferings < ActiveRecord::Migration
  def change
    create_table :course_offerings do |t|
      t.integer :year, null: false, limit: 2
      t.string :quarter
      t.string :url
      t.references :course, index: true

      t.timestamps
    end
  end
end
