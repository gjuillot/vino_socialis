class SuperficiesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @superficy.save
    redirect
  end
  
   def update
    @superficy.update_attributes(params[:superficy])
    redirect
  end
  
  private
  def redirect
    if @superficy.region_id
      redirect_to edit_region_path(Region.find(@superficy.region_id))
    else
      redirect_to edit_area_path(Area.find(@superficy.area_id))
    end
  end
  
end
