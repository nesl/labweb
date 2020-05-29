class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :lastname, limit: 32, null: false
      t.string :firstname, limit: 32, null: false
      t.string :middleinitial, limit: 1
      t.string :webname, limit: 32
      t.string :email
      t.string :url
      t.string :urlphoto
      t.string :phonework, limit: 32
      t.string :phonehome, limit: 32
      t.string :phonecell, limit: 32
      t.string :fax, limit: 32
      t.string :addressoffice
      t.string :addresslab
      t.string :addressmail
      t.string :department
      t.string :urldepartment
      t.string :organization
      t.string :urlorganization
      t.text :biography
      t.text :researchinterests
      t.text :education
      t.text :professionalexperience
      t.text :professionalservice
      t.text :otherpublications
      t.text :patents
      t.text :awards
      t.text :skills
      t.text :interests
      t.text :secretary
      t.integer :bs_year, limit: 2
      t.string :bs_title
      t.string :bs_school
      t.string :bs_field
      t.boolean :bs_in_lab
      t.integer :ms_year, limit: 2
      t.string :ms_title
      t.string :ms_school
      t.string :ms_field
      t.string :ms_thesis
      t.boolean :ms_in_lab
      t.integer :phd_year, limit: 2
      t.string :phd_title
      t.string :phd_school
      t.string :phd_field
      t.string :phd_thesis
      t.boolean :phd_in_lab
      t.hstore :miscattributes
      t.references :person_category, index: true

      t.timestamps
    end
  end
end
