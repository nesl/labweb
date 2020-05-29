class AddAvOthersUploaderToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :avmediaupload, :string
    add_column :documents, :othersupload, :string
  end
end
