class CreateWebPages < ActiveRecord::Migration
  def change
    create_table :web_pages do |t|
      t.string :pagetitle, null: false
      t.string :bartitle
      t.text :body
      t.boolean :ispublic, null: false, default: false
      t.string :url

      t.timestamps
    end
  end
end
