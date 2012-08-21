class AreasController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /areas
  def index
  end

  # GET /areas/1
  def show
    @wines = Wine.find_all_by_area_id(@area.id)
  end

  def for_region_id()
    @areas = Area.find_all_by_region_id(params[:region_id])
    respond_to do |format|
      format.json { render :json => @areas }
    end
  end
end
