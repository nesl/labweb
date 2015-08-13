class Project < ActiveRecord::Base
  has_and_belongs_to_many :research_areas
  has_and_belongs_to_many :people
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :products
  has_and_belongs_to_many :grants
  belongs_to :main_research_area, :class_name => "ResearchArea", :foreign_key => "main_research_area_id"

  validates :name, presence: {message: ": Missing project name"}
  validates :title, presence: {message: ": Missing project title"}
  validates :isactive, presence: {message: ": Missing active/nonactive status"}
  validates :url, allow_nil: true, format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}

end
