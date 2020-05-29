class AddCarouselPhotoToCarouselItems < ActiveRecord::Migration
  def change
    add_column :carousel_items, :localphoto, :string
  end
end
