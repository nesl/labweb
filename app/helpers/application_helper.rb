module ApplicationHelper
  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      ENV["LABNAME"]
    else
      "#{page_title} | #{ENV["LABNAME"]}"
    end
  end
  
  def find_webpage_by_title(title)
    title.present? ? WebPage.where("pagetitle = ?",title).first : nil
  end
  
  def url_exists?(url_string)
    url = URI.parse(url_string)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == "https")
    res = req.request_head(url.path)
    res.code == "200"  
  end
  
end
