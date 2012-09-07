module ApplicationHelper
  
  def site_name
    "Vino Socialis"
  end
  
  def title(page_title)
    if (page_title.empty?)
      site_name
    else
      "#{site_name} - #{page_title}"
    end
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
  
  def link_to_wine_tastings(wine)
    content_tag(:a, content_tag(:i, "", class: "icon-list") + ' ' + t('icon.wine_tastings'), :href => tastings_path(:wine => wine), :method => :get)
  end
  
  def link_to_encave(path)
    content_tag(:a, content_tag(:i, "", class: "icon-shopping-cart") + ' ' + t('icon.encave'), :href => path, :method => :post)
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
  
  def link_to_new_wine(estate)
    content_tag(:a, content_tag(:i, "", class: "icon-plus") + ' ' + t('icon.new_wine'), :href => new_wine_path(:estate_id => estate.id, :estate_name => estate.name))
  end
  
  def link_to_recommand(wine)
    content_tag(:a, content_tag(:i, "", class: "icon-heart") + ' ' + t('icon.recommand'), :href => recommand_wine_path(wine), :method => :get)
  end
  
  def link_to_unrecommand(wine)
    content_tag(:a, content_tag(:i, "", class: "icon-heart icon-white") + ' ' + t('icon.unrecommand'), :href => unrecommand_wine_path(wine), :method => :get)
  end
  
  def link_to_message(user)
    content_tag(:a, content_tag(:i, "", class: "icon-envelope") + ' ' + t('icon.converse'), :href => new_conversation_path(:user => user), :method => :get)
  end
  
  def star_rating(note, max)
    raw "<i class='icon-star'></i>"*(note.round)# + "<i class='icon-star-empty'></i>"*(max-note)
  end
  
  def select_vintage(f, selected = '')
    years = (1900..(Time.now.year)).to_a.reverse.insert(0, t('helpers.label.bottle.no_vintage'))
    f.select :vintage, years, selected: selected
  end

  def compartment_letter(wine_rack, total_row, total_column)
    letters = ('A'..'Z').to_a  + ('AA'..'ZZ').to_a
    letters[total_row * wine_rack.total_columns + total_column]
  end
end
