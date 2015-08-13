class WebPage < ActiveRecord::Base
  validates :pagetitle, presence: {message: ": Missing web page title"}
  validates :ispublic, presence: {message: ": Missing public/nonpublic status"}
  validates :url, allow_nil: true, allow_blank: true, format: {with: URI::regexp(%w(http https)),  message: ": URL is malformed"}
end
