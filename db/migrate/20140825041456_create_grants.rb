class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :description
      t.boolean :isactive, null: false, default: true
      t.string :url
      t.date :startdate
      t.date :enddate
      t.integer :totalawardamount
      t.string :fundingagencyname
      t.string :awardnumber
      t.string :fundingagencyurl
      t.string :fundingagencylogourl
      t.string :fundingagencygranturl
      t.string :programname
      t.string :programurl
      t.hstore :miscattributes

      t.timestamps
    end
  end
end
