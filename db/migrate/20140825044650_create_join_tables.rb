class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table :documents_grants, id: false do |t|
      t.belongs_to :document
      t.belongs_to :grant
    end
    create_table :documents_projects, id: false do |t|
      t.belongs_to :document
      t.belongs_to :project
    end
    create_table :documents_research_areas, id: false do |t|
      t.belongs_to :document
      t.belongs_to :research_area
    end
    create_table :grants_people, id: false do |t|
      t.belongs_to :grant
      t.belongs_to :person
    end
    create_table :grants_products, id: false do |t|
      t.belongs_to :grant
      t.belongs_to :product
    end
    create_table :grants_projects, id: false do |t|
      t.belongs_to :grant
      t.belongs_to :project
    end
    create_table :grants_research_areas, id: false do |t|
      t.belongs_to :grant
      t.belongs_to :research_area
    end
    create_table :people_projects, id: false do |t|
      t.belongs_to :person
      t.belongs_to :project
    end
    create_table :people_research_areas, id: false do |t|
      t.belongs_to :person
      t.belongs_to :research_area
    end
    create_table :products_projects, id: false do |t|
      t.belongs_to :product
      t.belongs_to :project
    end
    create_table :products_research_areas, id: false do |t|
      t.belongs_to :product
      t.belongs_to :research_area
    end
    create_table :projects_research_areas, id: false do |t|
      t.belongs_to :project
      t.belongs_to :research_area
    end
  end
end
