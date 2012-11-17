module ConsumptionsHelper
  
  def consumption_action_button(consumption)
      # ACTION LINKS
    res = '<div class="btn-group">
              <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
                Actions <span class="caret"></span>
              </button>
              <ul class="dropdown-menu">'
      
      res += link_to_show(consumption_path(consumption))
      
      if can? :manage, consumption
        res += link_to_edit(edit_consumption_path(consumption))
        res += link_to content_tag(:i, "", class: "icon-trash") + ' ' + t('icon.cancel') , consumption, confirm: 'Are you sure?', method: :delete
      end
      res += '</ul></div>'
      
      return raw res
  end
end
