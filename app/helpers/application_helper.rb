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
    content_tag(:a, content_tag(:i, "", class: "icon-thumbs-up") + ' ' + t('icon.validate'), :href => path, 'data-confirm' => 'Validate?', 'data-method' => :post, :rel => 'nofollow')
  end
  
  def link_to_unvalidate(path)
    content_tag(:a, content_tag(:i, "", class: "icon-thumbs-down") + ' ' + t('icon.unvalidate'), :href => path, 'data-confirm' => 'Unvalidate?', 'data-method' => :post, :rel => 'nofollow')
  end
  
  def link_to_tasting(path)
    content_tag(:a, content_tag(:i, "", class: "icon-glass") + ' ' + t('icon.taste'), :href => path, :method => :post)
  end
  
  def link_to_encave(path)
    content_tag(:a, content_tag(:i, "", class: "icon-shopping-cart") + ' ' + t('icon.encave'), :href => path, :method => :post)
  end
  
  def link_to_consume(path)
    content_tag(:a, content_tag(:i, "", class: "icon-hand-down") + ' ' + t('icon.consume'), :href => path, :method => :post)
  end
  
  def star_rating(note, max)
    raw "<i class='icon-star'></i>"*note + "<i class='icon-star-empty'></i>"*(max-note)
  end
end
