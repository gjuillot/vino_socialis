class RegionsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /regions
  def index
  end

  # GET /regions/1
  def show
    @areas = @region.areas
  end

end
