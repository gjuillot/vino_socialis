class CountriesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /countries
  def index
    respond_to do |format|
      format.html
      format.json { render :json => @countries }
      format.xml { render :xml => @countries }
    end
  end

  # GET /countries/1
  def show
    @regions = @country.regions
    respond_to do |format|
      format.html
      format.json { render :json => @country.to_json(:include => [:regions]) }
      format.xml { render :xml => @country.to_xml(:include => [:regions]) }
    end
  end

  def comment
    comment = @country.comments.new
    comment.comment = params[:comment][:comment]
    comment.user = current_user
    comment.save
    redirect_to @country
  end
end
