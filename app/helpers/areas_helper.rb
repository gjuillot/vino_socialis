module AreasHelper
  def full_area_name(area)
    link_to(area.region.country.name, area.region.country) + ' > ' + link_to(area.region.name, area.region) + ' > ' + link_to(area.name, area)
  end
end
