class AddUrlextpaperToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :urlextpaper, :string
  end
end
