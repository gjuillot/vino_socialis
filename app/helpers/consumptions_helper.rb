module ConsumptionsHelper
  
  def consumption_action_buttons(consumption)
    res = '<div class="action-button-group">'
    res += action_button_show(consumption)
    if can? :manage, consumption
      res += action_button_edit(consumption)
      res += action_button_delete(consumption)
    end
    res += '</div>'
    return raw res
  end
  
end
