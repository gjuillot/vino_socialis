module AreasHelper
  def full_area_name(area, options = {})
    html ||= options[:html]
    if (html)
      link_to(area.region.country.name, area.region.country) + ' > ' + link_to(area.region.name, area.region) + ' > ' + link_to(area.name, area)
    else
      "#{area.region.country.name} > #{area.region.name} > #{area.name}"
    end
  end
end
