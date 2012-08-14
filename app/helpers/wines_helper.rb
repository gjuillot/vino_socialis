module WinesHelper
  def wine_name(wine, options = {})
    estate ||= options[:estate]
    area ||= options[:area]
    html ||= options[:html]
    links ||= options[:links]
    res = "";
    if (estate)
      res += html ? link_to(wine.estate.name, wine.estate) : wine.estate.name
      res += ' - '
    end
    res += html ? link_to(wine.name, wine) : wine.name
    if (area)
      res += ' - '
      res += html ? link_to(wine.area.name, wine.area) : wine.area.name
    end
    if (html && links)
      res += ' - ' + link_to_tasting(taste_wine_path(wine))
      res += link_to_encave(encave_wine_path(wine))
      if can? :manage, wine
        res += ' - ' + link_to_edit(edit_wine_path(wine))
        res += link_to_destroy wine
        if wine.validated?
          res += link_to_unvalidate(unvalidate_wine_path(wine))
        else
          res += link_to_validate(validate_wine_path(wine))
        end
      end
    end
    return raw(res)
  end
end
