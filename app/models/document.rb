class Document < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper
  belongs_to :document_category
  
  mount_uploader :paperupload, DocumentPaperUploader
  mount_uploader :slidesupload, DocumentSlidesUploader
  mount_uploader :avmediaupload, DocumentAvmediaUploader
  mount_uploader :othersupload, DocumentOthersUploader

  has_many :document_person_maps, -> { order(:rank) }, inverse_of: :document,
           :dependent => :destroy
  has_many :people, :through => :document_person_maps
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :research_areas
  has_and_belongs_to_many :grants
  belongs_to :main_research_area, :class_name => "ResearchArea", :foreign_key => "main_research_area_id"

  accepts_nested_attributes_for :document_person_maps, :allow_destroy => true # TODO: reject_if: :all_blank

  validates :tryear, presence: {message: ": Missing year"}
  validates :tryear, numericality: {
              only_integer: true, greater_than: 1970, less_than: 2070,
              message: ": Document year does not seem right"
            }

  validates :trmonth, presence: {message: ": Missing month"}
  validates :trmonth, numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 12,
              message: ": Document month does not seem right"
            }

  validates :trnumber, presence: {message: ": Missing number"}
  validates :title, presence: {message: ": Missing title"}
  validates_inclusion_of :ispublic, :in => [true, false], message: ": Missing public/nonpublic status"
  validates :islabdocument, presence: {message: ": Missing lab status"}

  validates :urlextpaper, :urldoi, :urlpublisher, :urlgooglescholar, :urlciteseer,
            allow_nil: true, allow_blank: true,
            format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}

  validates :pubvol, allow_nil: true, format: {
              with: /\A((\d+)|([IVXLCDM]+))?\z/,
              message: ": Volume is in wrong format"
            }
  validates :pubnum, allow_nil: true, format: {
              with: /\A\d*\z/,
              message: ": Number start is in wrong format"
            }
  validates :pubnum_end, allow_nil: true, format: {
              with: /\A\d*\z/,
              message: ": Number end is in wrong format"
            }
  validates :pubpagecount, allow_nil: true, format: {
              with: /\A\d*\z/,
              message: ": Page Count is in wrong format"
            }
  validates :pubpagefirst, allow_nil: true, format: {
              with: /\A((\d+)|([IVXLCDM]+)|([ivxlcdm]+))?\z/,
              message: ": Page number start is in wrong format"
            }
  validates :pubpagelast, allow_nil: true, format: {
              with: /\A((\d+)|([IVXLCDM]+)|([ivxlcdm]+))?\z/,
              message: ": Page number end is in wrong format"
            }


  def self.get_trnumber(year, month)
    results = Document.find_by_sql "SELECT MAX(trnumber) AS trnumber FROM documents d WHERE d.tryear=#{year} AND d.trmonth=#{month}"
    return ((results && results[0] && results[0].trnumber) ? (results[0].trnumber + 1) : 1)
  end

  def self.find_all_in_priorityrange_sorted_by_date(min_priority=0,max_priority=1,count=5)
    Document.find_by_sql "SELECT d.* FROM documents d, documentcategories dc WHERE d.documentcategory_id = dc.id AND dc.priority >= #{min_priority} AND dc.priority <= #{max_priority} ORDER BY pubdate DESC LIMIT #{count}"
  end
  
  def citation
    ans = "#{authors_string}. \"#{title}\", #{pubin.blank? ? "" : pubin + ","} #{Date::MONTHNAMES[pubdate.month]} #{pubdate.year}."
  end

  def citation_formatted
    ans = "<b>#{title}</b><br> #{authors_string}.<br> #{pubin.blank? ? "" : pubin + ","} #{Date::MONTHNAMES[pubdate.month]} #{pubdate.year}."
    return ans.html_safe
  end

  def authors_list
    # TODO: obselete this no-op method
    people
  end
  
  def authors_string
    author_string = people.map {|p|
      p.get_name_first_middleinitial_last
    }.join(", ")
    last_comma_index = author_string.rindex(',')
    author_string.insert(last_comma_index+1, " and ") if last_comma_index
    return author_string
  end

  def has_local_files?
    paperupload.present? || slidesupload.present? || avmediaupload.present? || othersupload.present?
  end
end
