class CreateOrderToResearchAreas < ActiveRecord::Migration
  def change
	add_column :research_areas, :order, :integer
  end
end
