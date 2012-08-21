module WinesHelper
  def wine_name(wine, options = {})
    color ||= options[:color]
    estate ||= options[:estate]
    area ||= options[:area]
    html ||= options[:html]
    links ||= options[:links]
    
    res = ""

    if links
      res += "<tr><td>";
    end
    
    # COLOR
    if color
      res += wine_color_image(wine)
      if links
        res += "</td><td>"
      else
        res += "  "
      end
    end
    
    # ESTATE
    if (estate)
      res += (html ? link_to(wine.estate.name, wine.estate) : wine.estate.name)
      if links
        res += "</td><td>"
      else
        res += ' - '
      end
    end
    
    # WINE
    res += html ? link_to(wine.name, wine) : wine.name
    
    # AREA
    if (area)
      if links
        res += "</td><td>"
      else
        res += ' - '
      end
      res += (html ? link_to(wine.area.name, wine.area) : wine.area.name)
    end
    
    if links
      res += '</td>'
    end
    
    if (links)
      # ACTION LINKS
      res += '<td>
        <div class="btn-group">
          <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
            Actions <span class="caret"></span>
          </button>
          <ul class="dropdown-menu">'
      
      res += link_to_tasting(taste_wine_path(wine))
      res += link_to_encave(encave_wine_path(wine))
      
      # MODERATION
      if can? :manage, wine
        res += '<li class="divider"></li>'
          
        res += link_to_edit(edit_wine_path(wine))
        
        if wine.validated?
          res += link_to_unvalidate(unvalidate_wine_path(wine))
        else
          res += link_to_validate(validate_wine_path(wine))
        end
      end
      res += '</ul></div></td>'
    end
    
    if links
      res += '</tr>'
    end
    
    return raw(res)
  end
  
  def wine_color_image(wine)
    raw '<a href="#" rel="tooltip" title="' + t("wine.color.#{wine.wine_color}") + '">' + image_tag("wine_colors/#{wine.wine_color}.png", :size => "12x12") + '</a>'
  end
end