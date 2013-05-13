class AreaColorGrapesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
    @area_color_grape.save
    redirect_to edit_area_path(Area.find(@area_color_grape.area_id))
  end
  
   def update
    @area_color_grape.update_attributes(params[:area_color_grape])
    redirect_to edit_area_path(Area.find(@area_color_grape.area_id))
  end
  
end
