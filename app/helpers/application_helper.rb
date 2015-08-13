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
end
