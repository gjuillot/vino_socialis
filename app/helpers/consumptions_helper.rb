module ConsumptionsHelper
  
  def link_to_consume(path)
    link_to content_tag(:i, "", class: "icon-hand-down"), path, method: :post
  end
end
