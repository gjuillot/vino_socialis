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
  
  def link_to_edit(path)
    link_to content_tag(:i, "", class: "icon-edit"), path
  end
  
  def link_to_destroy(model)
    link_to content_tag(:i, "", class: "icon-trash"), model, confirm: 'Are you sure?', method: :delete
  end
  
  def link_to_validate(path)
    link_to content_tag(:i, "", class: "icon-thumbs-up"), path, confirm: 'Validate?', method: :post
  end
  
  def link_to_unvalidate(path)
    link_to content_tag(:i, "", class: "icon-thumbs-down"), path, confirm: 'Unvalidate?', method: :post
  end
end
