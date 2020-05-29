class ResearchArea < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :products
  has_and_belongs_to_many :grants
  has_and_belongs_to_many :people

  validates :name, presence: {message: ": Missing research area name"}

end
