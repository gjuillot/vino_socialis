module BottlesHelper
  
    def link_to_encave(path)
    link_to content_tag(:i, "", class: "icon-shopping-cart"), path, method: :post
  end
end
