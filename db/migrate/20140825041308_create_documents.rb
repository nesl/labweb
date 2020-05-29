class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :tryear, null: false, limit: 2
      t.integer :trmonth, null: false, limit: 1
      t.integer :trnumber, null: false, limit: 1
      t.string :title, null: false
      t.text :abstract
      t.string :filename
      t.binary :file
      t.string :urlpdfpaper
      t.string :urlsrcpaper
      t.string :urlpdfpresentation
      t.string :urlsrcpresentation
      t.string :urlavmedia
      t.string :urldoi
      t.string :urlpublisher
      t.string :urlgooglescholar
      t.string :urlciteseer
      t.string :pubin
      t.string :pubvol, limit: 8
      t.string :pubnum, limit: 8
      t.string :pubnum_end, limit: 8
      t.string :pubpagefirst, limit: 8
      t.string :pubpagelast, limit: 8
      t.string :pubpagecount, limit: 8
      t.date :pubdate
      t.date :pubdate_end
      t.string :pubplace, limit: 32
      t.string :publisher, limit: 64
      t.boolean :ispublic, null: false, default: false
      t.boolean :islabdocument, null: false, default: true
      t.hstore :miscattributes
      t.references :document_category, index: true
      t.references :main_research_area, index: true

      t.timestamps
    end
  end
end
