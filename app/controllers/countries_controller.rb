class CountriesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /countries
  def index
  end

  # GET /countries/1
  def show
    @regions = @country.regions
  end

  def comment
    comment = @country.comments.new
    comment.comment = params[:comment][:comment]
    comment.user = current_user
    comment.save
    redirect_to @country
  end
end
