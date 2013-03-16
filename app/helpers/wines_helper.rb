module WinesHelper
  def wine_name(wine, options = {})
    color ||= options[:color]
    estate ||= options[:estate]
    area ||= options[:area]
    html ||= options[:html] && !current_user.nil?
    links ||= options[:links]
    label ||= options[:label]
    do_not_close_tr ||= options[:do_not_close_tr]
    recommandations ||= options[:recommandations]
    separator = options[:separator] || ' - '
    
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
        res += separator
      end
    end
    
    # LABEL
    if (label)
      res += image_tag(wine.labels.validated.first.image_url(:micro).to_s) if wine.labels.validated.any?
      res += "</td><td>" if links
    end
    
    # WINE
    res += html ? link_to(wine.name, wine) : wine.name
    
    # AREA
    if (area)
      if links
        res += "</td><td>"
      else
        res += separator
      end
      res += (html ? link_to(wine.area.name, wine.area) : wine.area.name)
    end
    
    # RECOMMANDATIONS
    if recommandations
      if links
        res += "</td><td>"
      else
        res += separator
      end
      res += '<i class="icon-heart"></i>' * wine.recommandations_but(current_user).count
    end
    
    # ACTION BUTTON
    if links
      if current_user.nil? or do_not_close_tr
        res += '</td>'
      else
        res += '</td><td>' + wine_action_buttons(wine) + '</td>'
      end
      res += '</tr>' unless do_not_close_tr
    end
    
    return raw(res)
  end
  
  def wine_action_buttons(wine)
    res = '<div class="action-button-group">'
    
    res += action_button_show(wine)
    res += action_button_wine_tasting(wine)
    res += '|&nbsp;&nbsp;&nbsp;'
    res += action_button_add_label(wine)
    res += (wine.recommanded_by?(current_user) ? action_button_unrecommand(wine) : action_button_recommand(wine))
    res += action_button_taste(wine)
    res += action_button_encave(wine)
    
    if can? :manage, wine
      res += '|&nbsp;&nbsp;&nbsp;'
        res += action_button_edit(wine)
      
      if wine.validated?
        res += action_button_unvalidate(wine)
      else
        res += action_button_validate(wine)
      end
      
      if can? :replace, Wine and @replaced_wine
        res += action_button_replace(replace_wine_path(wine, replaced: @replaced_wine.id), @replaced_wine.name)
      end
    end
    
    res += '</div>'
    return raw res
  end
  
  def action_button_add_label(wine)
    action_button(add_label_wine_path(wine), "icon-add-label", t('icon.label'))
  end
  
  def action_button_recommand(wine)
    action_button(recommand_wine_path(wine), "icon-heart", t('icon.recommand'))
  end
  
  def action_button_unrecommand(wine)
    action_button(unrecommand_wine_path(wine), "icon-unrecommand", t('icon.unrecommand'))
  end
  
  def action_button_taste(wine)
    action_button(taste_wine_path(wine), "icon-taste", t('icon.taste'))
  end
  
  def action_button_encave(wine)
    action_button(encave_wine_path(wine), "icon-encave", t('icon.encave'))
  end
  
  def wine_color_image_2(wine_color, tooltip=true, move_left = 0, text=false)
    if !tooltip
      res = image_tag("wine_colors/#{wine_color}.png", :size => "12x12", :style => "position:relative;left:#{move_left}px")
      res += ' ' + t("wine.color.#{wine_color}") if text
      return res
    end
    raw '<a href="#" rel="tooltip" title="' + t("wine.color.#{wine_color}") + '">' + wine_color_image_2(wine_color, false) + '</a>'
  end
  
  def wine_color_image(wine, tooltip=true, move_left = 0, text=false)
    return wine_color_image_2(wine.wine_color, tooltip, move_left, text)
  end
  
  def no_wine_color_image(move_left = 0)
    return image_tag("wine_colors/nil.png", :size => "12x12", :style => "position:relative;left:#{move_left}px")
  end
  
  def wine_count_total
    Wine.all.count
  end
  
  def wine_count_validated
    Wine.validated.count
  end
  
  def wine_count_unvalidated
    Wine.not_validated.count
  end
end