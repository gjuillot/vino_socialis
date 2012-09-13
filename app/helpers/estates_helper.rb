module EstatesHelper
  
  def estate_action_button(estate, replaced = nil)
    res = '
    <div class="btn-group">
      <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
        Actions
        <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">'
      
      res += link_to_show(estate_path(estate))
      
      if can? :create, Wine
        res += link_to_new_wine(estate)
      end
      
      if can? :manage, estate
        res += '<li class="divider"></li>'
        res += link_to_edit(edit_estate_path(estate))
        res += (estate.validated? ? link_to_unvalidate(unvalidate_estate_path(estate)) : link_to_validate(validate_estate_path(estate)))
        if replaced
          res += content_tag(:a, content_tag(:i, "", class: "icon-refresh") + ' Remplacer "' + replaced.name + '"', :href => replace_estate_path(estate, replaced: replaced.id))
        end
      end
    res += '
      </ul>
    </div>'
    return raw res
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
