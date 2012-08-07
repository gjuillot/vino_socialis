module ApplicationHelper
  
  def site_name
    "Vino Socialis"
  end
  
  def title(page_title)
    if (page_title.empty?)
      site_name
    else
      "#{site_name} - #{page_title}"
    end
  end
end
