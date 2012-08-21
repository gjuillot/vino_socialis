class CountriesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /countries
  def index
  end

  # GET /countries/1
  def show
    @regions = @country.regions
  end

end
