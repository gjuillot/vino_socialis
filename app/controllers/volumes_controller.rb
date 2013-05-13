class VolumesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @volume.save
    redirect
  end
  
   def update
    @volume.update_attributes(params[:volume])
    redirect
  end
  
  private
  def redirect
    if @volume.region_id
      redirect_to edit_region_path(Region.find(@volume.region_id))
    else
      redirect_to edit_area_path(Area.find(@volume.area_id))
    end
  end
end
