module WinesHelper
  def wine_name(wine, options = {})
    color ||= options[:color]
    estate ||= options[:estate]
    area ||= options[:area]
    html ||= options[:html]
    links ||= options[:links]
    recommandations ||= options[:recommandations]
    
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
    
    # RECOMMANDATIONS
    if recommandations
      if links
        res += "</td><td>"
      else
        res += ' - '
      end
      res += '<i class="icon-heart"></i>' * wine.recommandations_but(current_user).count
    end
    
    # ACTION BUTTON
    if links
      res += '</td><td>' + wine_action_button(wine) + '</td></tr>'
    end
    
    return raw(res)
  end
  
  def wine_action_button(wine)
      # ACTION LINKS
    res = '<div class="btn-group">
              <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
                Actions <span class="caret"></span>
              </button>
              <ul class="dropdown-menu">'
      
      res += link_to_show(wine_path(wine))
      res += link_to_wine_tastings(wine)
      res += '<li class="divider"></li>'
      res += (wine.recommanded_by?(current_user) ? link_to_unrecommand(wine) : link_to_recommand(wine))
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
      res += '</ul></div>'
      
      return raw res
  end
  
  def wine_color_image(wine, tooltip=true)
    if !tooltip
      return image_tag("wine_colors/#{wine.wine_color}.png", :size => "12x12")
    end
    raw '<a href="#" rel="tooltip" title="' + t("wine.color.#{wine.wine_color}") + '">' + wine_color_image(wine, false) + '</a>'
  end
  
  def no_wine_color_image(move_left = 0)
    return image_tag("wine_colors/nil.png", :size => "12x12", :style => "position:relative;left:#{move_left}px")
  end
  
  def wine_count_total
    Wine.all.count
  end
  
  def wine_count_validated
    Wine.where('validation = ?', true).count
  end
end