class CreateCarouselItems < ActiveRecord::Migration
  def change
    create_table :carousel_items do |t|
      t.string :itemtype
      t.string :caption
      t.string :sourceurl
      t.text :description
      t.string :gotourl
      t.integer :position

      t.timestamps null: false
    end
  end
end
