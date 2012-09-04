module AreasHelper
  def full_area_name(area, options = {})
    html ||= options[:html]
    separator1 = options[:separator1] || ' > '
    separator2 = options[:separator2] || ' > '
    if (html)
      link_to(area.region.country.name, area.region.country) + separator1 + link_to(area.region.name, area.region) + separator2 + link_to(area.name, area)
    else
      "#{area.region.country.name}#{separator1}#{area.region.name}#{separator2}#{area.name}"
    end
  end
end
