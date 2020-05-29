class ChangeNameFromResearchAreas < ActiveRecord::Migration
  def change
	add_index :research_areas, :name, unique: true
  end
end
