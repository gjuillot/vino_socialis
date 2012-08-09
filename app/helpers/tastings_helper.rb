module TastingsHelper
  
  def link_to_tasting(path)
    link_to content_tag(:i, "", class: "icon-glass"), path, method: :post
  end
end
