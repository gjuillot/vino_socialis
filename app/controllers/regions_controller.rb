class RegionsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /regions
  def index
    respond_to do |format|
      format.html
      format.json { render :json => @regions }
      format.xml { render :xml => @regions }
    end
  end

  # GET /regions/1
  def show
    @areas = @region.areas
    respond_to do |format|
      format.html
      format.json { render :json => @region.to_json(:include => [:areas]) }
      format.xml { render :xml => @region.to_xml(:include => [:areas]) }
    end
  end

end
