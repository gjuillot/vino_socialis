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
  
  def link_to_show(path)
    content_tag(:a, content_tag(:i, "", class: "icon-eye-open") + ' ' + t('icon.show'), :href => path)
  end
  
  def link_to_edit(path)
    content_tag(:a, content_tag(:i, "", class: "icon-edit") + ' ' + t('icon.edit'), :href => path)
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
  
  def star_rating(note, max)
    raw "<i class='icon-star'></i>"*note + "<i class='icon-star-empty'></i>"*(max-note)
  end
  
  def link_to_consume(path)
    content_tag(:a, content_tag(:i, "", class: "icon-hand-down") + ' ' + t('icon.consume'), :href => path, :method => :post)
  end
end
