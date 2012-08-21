module TastingsHelper
  def tasting_action_button(tasting)
    res = '<div class="btn-group">
              <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
                Actions <span class="caret"></span>
              </button>
              <ul class="dropdown-menu">'
      
      res += link_to_show(tasting_path(tasting))
      res += link_to_wine_tastings(tasting.wine)
      
      # MODERATION
      if can? :manage, tasting
        res += '<li class="divider"></li>'
        res += link_to_edit(edit_tasting_path(tasting))
        res += link_to_destroy tasting
      end
      res += '</ul></div>'
      
      return raw res
  end
end
