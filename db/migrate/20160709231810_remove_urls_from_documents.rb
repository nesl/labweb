class RemoveUrlsFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :file, :string
    remove_column :documents, :filename, :string
    remove_column :documents, :urlpdfpaper, :string
    remove_column :documents, :urlpdfpresentation, :string
    remove_column :documents, :urlsrcpaper, :string
    remove_column :documents, :urlsrcpresentation, :string
    remove_column :documents, :urlavmedia, :string
  end
end
