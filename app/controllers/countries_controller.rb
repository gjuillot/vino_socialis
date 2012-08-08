class CountriesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /countries
  def index
  end

  # GET /countries/1
  def show
    @regions = @country.regions
  end

  # GET /countries/new
  def new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  def create
    if @country.save
      redirect_to @country, notice: 'Country was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /countries/1
  def update
    if @country.update_attributes(params[:country])
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
    redirect_to countries_url
  end
end
