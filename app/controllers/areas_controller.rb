class AreasController < ApplicationController
  # GET /areas
  def index
    @areas = Area.all
  end

  # GET /areas/1
  def show
    @area = Area.find(params[:id])
  end

  # GET /areas/new
  def new
    @area = Area.new
    @regions = Region.all
  end

  # GET /areas/1/edit
  def edit
    @area = Area.find(params[:id])
    @regions = Region.all
  end

  # POST /areas
  def create
    @area = Area.new(params[:area])
    
    if @area.save
      redirect_to @area, notice: 'Area was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /areas/1
  def update
    @area = Area.find(params[:id])
    
    if @area.update_attributes(params[:area])
      redirect_to @area, notice: 'Area was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /areas/1
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    redirect_to areas_url
  end
end
