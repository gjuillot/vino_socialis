module ApplicationHelper
  
  def site_name
    "Vinosus"
  end
  
  def title(page_title)
    if (page_title.empty?)
      site_name
    else
      "#{site_name} | #{page_title}"
    end
  end
  
  def action_button(href, icon, text)
    "<a href='#{href}' data-toggle='tooltip' title='#{text}'><i class='icon #{icon}'></i></a>"
  end
  
  def action_button_show(object)
    action_button(url_for(object), "icon-eye-open", t('icon.show'))
  end
  
  def action_button_edit(object)
    action_button(url_for([:edit, object]), "icon-edit", t("icon.edit"))
  end
  
  def action_button_delete(object)
    id = Random.rand(1000000)
    "<a id='#{id}' href='#{url_for(object)}' data-method='delete' data-confirm='Are you sure?' rel='nofollow'><i class='icon-trash'></i></a><span id='#{id}' class='pull-right'>#{t('icon.destroy')}</span>"
  end
  
  def action_button_unvalidate(object)
    href = url_for([:unvalidate, object])
    text = t('icon.unvalidate')
    icon = 'icon-thumbs-down'
    "<a href='#{href}' data-toggle='tooltip' title='#{text}' data-method='post' data-confirm='Are you sure?' rel='nofollow'><i class='icon #{icon}'></i></a>"
  end
  
  def action_button_validate(object)
    href = url_for([:validate, object])
    text = t('icon.validate')
    icon = 'icon-thumbs-up'
    "<a href='#{href}' data-toggle='tooltip' title='#{text}' data-method='post' data-confirm='Are you sure?' rel='nofollow'><i class='icon #{icon}'></i></a>"
  end
  
  def action_button_replace(path, text)
    action_button(path, "icon-refresh", 'Remplacer "' + text + '"')
  end
  

  
  def link_to_show(path)
    content_tag(:a, content_tag(:i, "", class: "icon-eye-open") + ' ' + t('icon.show'), :href => path)
  end
  
  def link_to_edit(path)
    content_tag(:a, content_tag(:i, "", class: "icon-edit") + ' ' + t('icon.edit'), :href => path)
  end
  
  def button_to_edit(path)
    content_tag(:a, content_tag(:i, "", class: "icon-edit icon-white") + ' ' + t('icon.edit'), :href => path, :class => 'btn btn-primary')
  end
  
  def link_to_destroy(model)
    link_to content_tag(:i, "", class: "icon-trash") + ' ' + t('icon.destroy') , model, confirm: 'Are you sure?', method: :delete
  end
  
  def button_to_destroy(model)
    link_to content_tag(:i, "", class: "icon-trash icon-white") + ' ' + t('icon.destroy') , model, confirm: 'Are you sure?', method: :delete, class: 'btn btn-primary'
  end
  
  def link_to_validate(path)
    content_tag(:a, content_tag(:i, "", class: "icon-thumbs-up") + ' ' + t('icon.validate'), :href => path, 'data-confirm' => 'Validate?', 'data-method' => :post, :rel => 'nofollow')
  end
  
  def link_to_unvalidate(path)
    content_tag(:a, content_tag(:i, "", class: "icon-thumbs-down") + ' ' + t('icon.unvalidate'), :href => path, 'data-confirm' => 'Unvalidate?', 'data-method' => :post, :rel => 'nofollow')
  end
  
  def link_to_tasting(path)
    content_tag(:a, content_tag(:i, "", class: "icon-glass") + ' ' + t('icon.taste'), :href => path, :method => :post)
  end
  
  def link_to_consume(path)
    content_tag(:a, content_tag(:i, "", class: "icon-hand-down") + ' ' + t('icon.consume'), :href => path, :method => :post)
  end
  
  def button_to_consume(path)
    content_tag(:a, content_tag(:i, "", class: "icon-hand-down icon-white") + ' ' + t('icon.consume'), :href => path, :method => :post, :class => 'btn btn-primary')
  end
  
  def link_to_unplace(bottle, position)
    content_tag(:a, content_tag(:i, "", class: "icon-share") + ' ' + t('icon.unplace'), :href => unplace_bottle_path(bottle, :wine_rack_position_id => position), :method => :get)
  end
  
  def link_to_message(user)
    content_tag(:a, content_tag(:i, "", class: "icon-envelope") + ' ' + t('icon.converse'), :href => new_conversation_path(:user => user), :method => :get)
  end
  
  def link_to_follow(user)
    content_tag(:a, content_tag(:i, "", class: "icon-star") + ' ' + t('icon.follow'), :href => follow_user_path(user), :method => :get)
  end
  
  def link_to_unfollow(user)
    content_tag(:a, content_tag(:i, "", class: "icon-star-empty") + ' ' + t('icon.unfollow'), :href => unfollow_user_path(user), :method => :get)
  end
  

  def select_vintage(f, selected = '')
    years = (1900..(Time.now.year)).to_a.reverse.insert(0, [t('helpers.label.bottle.no_vintage'), 0])
    f.select :vintage, years, selected: selected
  end

  def compartment_letter(wine_rack, total_row, total_column)
    letters = ('A'..'Z').to_a  + ('AA'..'ZZ').to_a
    letters[total_row * wine_rack.total_columns + total_column]
  end
  
  def formated_date(date)
    return l(date, format: :short) if user_signed_in? && current_user.date_format == ':short'
    return l(date, format: :long) if user_signed_in? && current_user.date_format == ':long'
    return l(date)
  end
  
  def formated_price(price, form = false)
    form ? number_with_precision(price, :precision => 2, :separator => '.') : number_to_currency(price, :unit => current_user.currency)
  end
  
  def formated_vintage(vintage, short = true)
    vintage > 0 ? vintage : (short ? '-' : t('helpers.label.bottle.no_vintage'))
  end

  def grape_variety_count_unvalidated
    GrapeVariety.not_validated.count
  end
  
  def dishes_array
    Pairing.select(:dish).group(:dish).map(&:dish)
  end
end
