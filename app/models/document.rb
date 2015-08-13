class Document < ActiveRecord::Base
  belongs_to :document_category
  has_many :document_person_maps
  has_many :people, :through => :document_person_maps
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :research_areas
  has_and_belongs_to_many :grants
  belongs_to :main_research_area, :class_name => "ResearchArea", :foreign_key => "main_research_area_id"

  validates :tryear, presence: {message: ": Missing year"}
  validates :trmonth, presence: {message: ": Missing month"}
  validates :trnumber, presence: {message: ": Missing number"}
  validates :title, presence: {message: ": Missing title"}
  validates :ispublic, presence: {message: ": Missing public/nonpublic status"}
  validates :islabdocument, presence: {message: ": Missing lab status"}

  validates :urlpdfpaper,  :urlsrcpaper,  :urlpdfpresentation,  :urlsrcpresentation,
            :urlavmedia,  :urldoi,  :urlpublisher,  :urlgooglescholar,  :urlciteseer,
            allow_nil: true, format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}

  validates :pubvol, allow_nil: true, format: {with:  /\A((\d+)|([IVXLCDM]+))?\z/, message:  ": Volume is in wrong format"}
  validates :pubnum, allow_nil: true, format: {with:  /\A\d*\z/, message:  ": Number start is in wrong format"}
  validates :pubnum_end, allow_nil: true, format: {with:  /\A\d*\z/, message:  ": Number end is in wrong format"}
  validates :pubpagecount, allow_nil: true, format: {with:  /\A\d*\z/, message:  ": Page Count is in wrong format"}
  validates :pubpagefirst, allow_nil: true, format: {with:  /\A((\d+)|([IVXLCDM]+)|([ivxlcdm]+))?\z/, message:  ": Page number start is in wrong format"}
  validates :pubpagelast, allow_nil: true, format: {with:  /\A((\d+)|([IVXLCDM]+)|([ivxlcdm]+))?\z/, message:  ": Page number end is in wrong format"}

  validates :tryear, numericality: {only_integer: true, greater_than: 1970, less_than: 2070, message: ": Document year does not seem right"}
  validates :trmonth, numericality: {only_integer: true, greater_than: 0, less_than: 13, message: ": Document month does not seem right"}

  def self.get_trnumber(year, month)
    results = Document.find_by_sql "SELECT MAX(trnumber) AS trnumber FROM documents d WHERE d.tryear=#{year} AND d.trmonth=#{month}"
    return ((results && results[0] && results[0].trnumber) ? (results[0].trnumber + 1) : 1)
  end

  def self.find_all_in_priorityrange_sorted_by_date(min_priority=0,max_priority=1,count=5)
    Document.find_by_sql "SELECT d.* FROM documents d, documentcategories dc WHERE d.documentcategory_id = dc.id AND dc.priority >= #{min_priority} AND dc.priority <= #{max_priority} ORDER BY pubdate DESC LIMIT #{count}"
  end

end
