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
  
end
