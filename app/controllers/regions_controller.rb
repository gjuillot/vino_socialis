class RegionsController < ApplicationController
  # GET /regions
  def index
    @regions = Region.all
  end

  # GET /regions/1
  def show
    @region = Region.find(params[:id])
  end

  # GET /regions/new
  def new
    @region = Region.new
    @countries = Country.all
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
    @countries = Country.all
  end

  # POST /regions
  def create
    @region = Region.new(params[:region])
    if @region.save
      redirect_to @region, notice: 'Region was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /regions/1
  def update
    @region = Region.find(params[:id])

    if @region.update_attributes(params[:region])
      redirect_to @region, notice: 'Region was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /regions/1
  def destroy
    @region = Region.find(params[:id])
    @region.destroy

    redirect_to regions_url
  end
end
