class AddUploaderToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :paperupload, :string
    add_column :documents, :slidesupload, :string
  end
end
