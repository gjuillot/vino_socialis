class ColorVolumesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @color_volume.save
    redirect_to edit_region_path(Region.find(@color_volume.region_id))
  end
  
   def update
    @color_volume.update_attributes(params[:color_volume])
    redirect_to edit_region_path(Region.find(@color_volume.region_id))
  end
  
end
