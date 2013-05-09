class SuperficiesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @superficy.save
    redirect_to edit_region_path(Region.find(@superficy.region_id))
  end
  
   def update
    @superficy.update_attributes(params[:superficy])
    redirect_to edit_region_path(Region.find(@superficy.region_id))
  end
  
end
