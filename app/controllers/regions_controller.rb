class RegionsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /regions
  def index
  end

  # GET /regions/1
  def show
    @areas = @region.areas
  end

  # GET /regions/new
  def new
    @countries = Country.all
  end

  # GET /regions/1/edit
  def edit
    @countries = Country.all
  end

  # POST /regions
  def create
    if @region.save
      redirect_to @region, notice: 'Region was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /regions/1
  def update
    if @region.update_attributes(params[:region])
      redirect_to @region, notice: 'Region was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
    redirect_to regions_url
  end
end
