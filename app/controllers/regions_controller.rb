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
    @color_volumes = {}
    @region.color_volumes.each do |color_volume|
    @color_volumes[color_volume.year] = [] unless @color_volumes.has_key? color_volume.year
    @color_volumes[color_volume.year] << {
      :index => 1 + @color_volumes[color_volume.year].size,
      :name => color_volume.color,
      :value => color_volume.volume}
    end
  end
  
  def edit
  end
  
  def update
    @region.update_attributes(params[:region])
    redirect_to @region
  end
  
  def comment
    comment = @region.comments.new
    comment.comment = params[:comment][:comment]
    comment.user = current_user
    comment.save
    redirect_to @region
  end

end
