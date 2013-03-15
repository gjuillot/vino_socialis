module EstatesHelper
  
  def estate_action_buttons(estate, replaced = nil)
    res = '<div class="action-button-group">'
    res += action_button_show(estate)
    
    if can? :create, Wine
      res += action_button_new_wine(estate)
    end
  
    if can? :manage, estate
        res += '|&nbsp;&nbsp;&nbsp;'
        res += action_button_edit(estate)
        res += action_button_unvalidate(estate) if estate.validated?
        res += action_button_validate(estate) if !estate.validated?
        res += action_button_replace(replace_estate_path(estate, replaced: replaced.id), replaced.name) if replaced
      end
    res += '</div>'
    return raw res
  end
  
  def action_button_new_wine(estate)
    action_button(new_wine_path(:estate_id => estate.id, :estate_name => estate.name), "icon-plus", t('icon.new_wine'))
  end
  
  def estate_count_total
    Estate.all.count
  end
  
  def estate_count_validated
    Estate.where('validation = ?', true).count
  end
  
  def estate_count_unvalidated
    Estate.where('validation = ?', false).count
  end
end
