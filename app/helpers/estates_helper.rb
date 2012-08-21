module EstatesHelper
  
  def estate_action_button(estate)
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
      end
    res += '
      </ul>
    </div>'
    return raw res
  end
end
