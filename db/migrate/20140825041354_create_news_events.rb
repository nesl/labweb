class CreateNewsEvents < ActiveRecord::Migration
  def change
    create_table :news_events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
