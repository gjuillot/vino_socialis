class AreasController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /areas
  def index
  end

  # GET /areas/1
  def show
    @wines = Wine.find_all_by_area_id(@area.id)
  end

  # GET /areas/new
  def new
    @regions = Region.all
  end

  # GET /areas/1/edit
  def edit
    @regions = Region.all
  end

  # POST /areas
  def create
    if @area.save
      redirect_to @area, notice: 'Area was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /areas/1
  def update
    if @area.update_attributes(params[:area])
      redirect_to @area, notice: 'Area was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /areas/1
  def destroy
    @area.destroy
    redirect_to areas_url
  end
  
  def for_region_id()
    @areas = Area.find_all_by_region_id(params[:region_id])
    respond_to do |format|
      format.json { render :json => @areas }
    end
  end
end
