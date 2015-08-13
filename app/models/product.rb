class Product < ActiveRecord::Base
  belongs_to :product_category
  has_many :product_person_maps
  has_many :people, :through => :product_person_maps
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :research_areas
  has_and_belongs_to_many :grants
  belongs_to :main_research_area, :class_name => "ResearchArea", :foreign_key => "main_research_area_id"

  validates :title, presence: {message: ": Missing title"}
  validates :ispublic, presence: {message: ": Missing public/nonpublic status"}
  validates :islabproduct, presence: {message: ": Missing lab status"}

  validates :url, allow_nil: true, format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}
  validates :year, numericality: {only_integer: true, greater_than: 1970, less_than: 2070, message: ": Product year does not seem right"}
  validates :month, numericality: {only_integer: true, greater_than: 0, less_than: 13, message: ": Product month does not seem right"}

end
