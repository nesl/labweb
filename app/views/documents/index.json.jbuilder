json.array!(@documents) do |document|
  json.extract! document, :id, :tryear, :trmonth, :trnumber, :title, :abstract, :filename, :file, :urlpdfpaper, :urlsrcpaper, :urlpdfpresentation, :urlsrcpresentation, :urlavmedia, :urldoi, :urlpublisher, :urlgooglescholar, :urlciteseer, :pubin, :pubvol, :pubnum, :pubnum_end, :pubpagefirst, :pubpagelast, :pubpagecount, :pubdate, :pubdate_end, :pubplace, :publisher, :ispublic, :islabdocument, :miscattributes, :document_category_id, :main_research_area_id
  json.url document_url(document, format: :json)
end
