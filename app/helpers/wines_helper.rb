module WinesHelper
  def wine_name(wine, options = {})
    color ||= options[:color]
    estate ||= options[:estate]
    area ||= options[:area]
    html ||= options[:html]
    links ||= options[:links]
    label ||= options[:label]
    do_not_close_tr ||= options[:do_not_close_tr]
    separator = options[:separator] || ' - '
    
    res = ""

    if links
      res += "<tr><td>";
    end
    
    # COLOR
    if color
      res += wine_icon(wine)
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
    
    # ACTION BUTTON
    if links
      res += '</td><td>' + wine_action_buttons(wine) + '</td>'
      res += '</tr>' unless do_not_close_tr
    end
    
    return raw(res)
  end
  
  def wine_action_buttons(wine)
    res = '<div class="action-button-group">'
    
    res += action_button_show(wine) if can? :read, wine
    res += action_button_wine_tasting(wine) if can? :read, Tasting
    res += '|&nbsp;&nbsp;&nbsp;' if can? :add_label, wine or can? :taste, wine or can? :encave, wine
    res += action_button_add_label(wine) if can? :add_label, wine
    res += action_button_taste(wine) if can? :taste, wine
    res += action_button_encave(wine) if can? :encave, wine
    
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
  
  def action_button_taste(wine)
    action_button(taste_wine_path(wine), "icon-taste", t('icon.taste'))
  end
  
  def action_button_wine_tasting(wine)
    if wine.tastings.any?
      action_button(tastings_wine_path(wine), 'icon-tastings', t('icon.wine_tastings'))
    else
      action_button(tastings_wine_path(wine), 'icon-tastings-white', t('icon.wine_tastings'))
    end
  end
  
  def action_button_encave(wine)
    action_button(encave_wine_path(wine), "icon-encave", t('icon.encave'))
  end
  
  def wine_color_code(wine_color)
    return "#800000" if Wine::RED.include? wine_color
    return "#ffaec9" if Wine::ROSE.include? wine_color
    return "#a85400" if wine_color == 'amber'
    return "#ffb340" if wine_color == 'sweet_white'
    return "#ff7f27" if wine_color == 'moelleux_white' or wine_color == 'natural_sweet'
    return "#f2f200" if wine_color == 'vin_jaune' or wine_color == 'vin_paille'
    return "#fff97d" if Wine::WHITE.include? wine_color
    return "#C3C3C3"
  end
  
  def wine_icon(wine, options={})
    wine_color_icon wine.wine_color, options
  end
  
  def no_wine_half_icon
    raw '<svg width="6" height="12" version="1.1" xmlns="http://www.w3.org/2000/svg" style="width:6px; height:12px"></svg>'
  end
  
  def wine_color_circle(wine_color, cx, cy, _class=nil)
    if _class.nil?
      res = '<circle cx="'+cx.to_s+'" cy="'+cy.to_s+'" r="6" style="fill:' + wine_color_code(wine_color) + ';" />'
    else
      res = '<circle class="'+_class+'" cx="'+cx.to_s+'" cy="'+cy.to_s+'" r="6" style="fill:' + wine_color_code(wine_color) + ';" />'
    end 
    unless wine_color.nil?
      if wine_color.include? 'sparkling'
        res += '<circle cx="'+cx.to_s+'" cy="'+cy.to_s+'" r="2" style="fill:white;" />'
      elsif wine_color.include? 'port'
        res += '<circle cx="'+cx.to_s+'" cy="'+cy.to_s+'" r="3" style="fill:black" />'
      end
    end
    return res
  end
  
  def wine_color_icon(wine_color, options={})
    options = {
      :tooltip => true,
      :text => false
    }.merge(options)
    options[:tooltip] = false if options[:text] or wine_color.blank?
    
    res = ''
    res = '<a href="#" rel="tooltip" title="' + t("wine.color.#{wine_color}") + '">' if options[:tooltip]

    res += '<svg width="12" height="12" version="1.1" xmlns="http://www.w3.org/2000/svg" style="width:12px; height:12px">' + wine_color_circle(wine_color, 6, 6) + '</svg>'

    res += ' ' + t("wine.color.#{wine_color}") if options[:text]
    
    res += '</a>' if options[:tooltip]
    
    return raw res
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