class WineRecommandationsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /tastings
  def index
    if params[:wine].blank?
      @recommandations = WineRecommandation.order('id DESC').limit(10)
    else
      @recommandations = WineRecommandation.where('wine_id = ?', params[:wine]).order('id DESC')
    end
  end
  
  def most
    @recommanded= WineRecommandation.select('wine_id, count(user_id) AS users').where('user_id != ?', current_user.id).group('wine_id').order("users DESC")
  end
  
end
