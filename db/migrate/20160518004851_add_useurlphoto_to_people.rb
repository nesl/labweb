class AddUseurlphotoToPeople < ActiveRecord::Migration
  def change
    add_column :people, :useurlphoto, :boolean, :null => false, :default => false
  end
end
