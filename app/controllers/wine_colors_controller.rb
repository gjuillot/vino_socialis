class WineColorsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /wine_colors
  def index
  end

  # GET /wine_colors/1
  def show
  end

  # GET /wine_colors/new
  def new
  end

  # GET /wine_colors/1/edit
  def edit
  end

  # POST /wine_colors
  def create
    if @wine_color.save
      redirect_to @wine_color, notice: 'WineColor was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /wine_colors/1
  def update
    if @wine_color.update_attributes(params[:wine_colors])
      redirect_to @wine_color, notice: 'WineColor was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /wine_colors/1
  def destroy
    @wine_color.destroy
    redirect_to wine_colors_url
  end
end
