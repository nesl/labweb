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

  # NOTE: This function can block the rest of procedures. Consider reimplement
  # this in javascript
  def url_exists?(url_string)
    url = URI.parse(url_string)
    req = Net::HTTP.new(url.host, url.port)
    req.open_timeout = 1
    req.read_timeout = 1
    req.use_ssl = (url.scheme == "https")
    path = url.path.present? ? url.path : '/'
    res = req.request_head(path)
    res.code == "200"
  rescue
    false #can't find the server
  end
  
end
