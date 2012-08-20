module AreasHelper
  def full_area_name(area, options = {})
    links ||= options[:links]
    if (links)
      link_to(area.region.country.name, area.region.country) + ' > ' + link_to(area.region.name, area.region) + ' > ' + link_to(area.name, area)
    else
      "#{area.region.country.name} > #{area.region.name} > #{area.name}"
    end
  end
end
