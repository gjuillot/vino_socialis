module TastingsHelper
  
  def tasting_action_buttons(tasting)
    res = '<div class="action-button-group">'
    res += action_button_show(tasting)
    if can? :manage, tasting
      res += action_button_edit(tasting)
      res += action_button_delete(tasting)
    end
    res += '</div>'
    return raw res
  end
  
  def action_button_wine_tasting(wine)
    action_button(tastings_path(:wine => wine), 'icon-list', t('icon.wine_tastings'))
  end
  
  def tasting_eye_colors(wine)
    if wine.white?
      [
        {value: 1, name: 'Verdatre', code: '#D0FA58'},
                {value: 2, name: 'Vert-jaune', code: '#E3FC43'},
        {value: 3, name: 'Jaune', code: '#F7FE2E'},
                {value: 4, name: 'Jaune-Doree', code: '#E9D317'},
        {value: 5, name: 'Doree', code: '#DBA901'},
                {value: 6, name: 'Doree-Ambre', code: '#D49304'},
        {value: 7, name: 'Ambree', code: '#CE7E07'}
      ]
    elsif wine.rose?
      [
        {value: 1, name: 'Rose', code: '#FFC0CB'},
                {value: 2, name: 'Rose-Framboise', code: '#E37689'},
        {value: 3, name: 'Framboise', code: '#C72C48'},
                {value: 4, name: 'Framboise-Saumonee', code: '#E34957'},
        {value: 5, name: 'Saumonee', code: '#FF6666'},
                {value: 6, name: 'Saumonee-Pelure oignon', code: '#FB7A5D'},
        {value: 7, name: 'Pelure oignon', code: '#F88E55'}
      ]
    elsif wine.red?
      [
        {value: 1, name: 'Violacee', code: '#C71585'},
                {value: 2, name: 'Violacee-Rubis', code: '#D31372'},
        {value: 3, name: 'Rubis', code: '#E0115F'},
                {value: 4, name: 'Rubis-Orangee', code: '#DF1D3A'},
        {value: 5, name: 'Orangee', code: '#DE2916'},
                {value: 6, name: 'Orangee-Tuilee', code: '#BA1417'},
        {value: 7, name: 'Tuilee', code: '#960018'}
      ]
    end
  end
end
