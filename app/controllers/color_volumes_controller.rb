class ColorVolumesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @color_volume.save
    redirect
  end
  
   def update
    @color_volume.update_attributes(params[:color_volume])
    redirect
  end
  
  private
  def redirect
    if @color_volume.region_id
      redirect_to edit_region_path(Region.find(@color_volume.region_id))
    else
      redirect_to edit_area_path(Area.find(@color_volume.area_id))
    end
  end
  
end
