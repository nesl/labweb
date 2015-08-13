class Grant < ActiveRecord::Base
  has_and_belongs_to_many :research_areas
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :people
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :products

  validates :name, presence: {message: ": Grant name is missing"}
  validates :title, presence: {message: ": Grant title is missing"}
  validates :isactive, presence: {message: ": Grant active/inactive status is missing"}
  validates :url, :fundingagencyurl, :fundingagencylogourl, :fundingagencygranturl, :programurl,
            allow_nil: true, format: {with: URI::regexp(%w(http https)), message: ": URL is malformed"}
  validates :totalawardamount, numericality: {only_integer: true, greater_than: 0,
            message: ": Grant award amount must be positive integer"}

end
