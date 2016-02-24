class AddLocalphotoToPeople < ActiveRecord::Migration
  def change
    add_column :people, :localphoto, :string
  end
end
