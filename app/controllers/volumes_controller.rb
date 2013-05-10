class VolumesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @volume.save
    redirect_to edit_region_path(Region.find(@volume.region_id))
  end
  
   def update
    @volume.update_attributes(params[:volume])
    redirect_to edit_region_path(Region.find(@volume.region_id))
  end
  
end
