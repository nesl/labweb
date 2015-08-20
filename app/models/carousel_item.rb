class CarouselItem < ActiveRecord::Base
  CAROUSEL_ITEM_TYPE_OPTIONS = %w(photo video Photo Video)
  validates :caption, presence: {message: ": Missing caption"}
  validates :itemtype, :inclusion => {:in => CAROUSEL_ITEM_TYPE_OPTIONS,  message: ": type is incorrect"}
  validates :sourceurl, format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}
  validates :gotourl, allow_nil: true, allow_blank: true, format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}
  validates :position, numericality: { only_integer: true }
end
