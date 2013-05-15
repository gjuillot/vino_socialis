class AreaColorGrapesController < ApplicationController
  
  load_and_authorize_resource
  
   def create
     params[:main].each_key do |main|
       acg = AreaColorGrape.new(params[:area_color_grape])
       acg.grape_variety_id = main.to_i
       acg.main = true
       acg.save
     end
     params[:second].each_key do |second|
       acg = AreaColorGrape.new(params[:area_color_grape])
       acg.grape_variety_id = second.to_i
       acg.main = false
       acg.save
     end
    redirect_to edit_area_path(Area.find(@area_color_grape.area_id))
  end
  
   def update
    @area_color_grape.update_attributes(params[:area_color_grape])
    redirect_to edit_area_path(Area.find(@area_color_grape.area_id))
  end
  
end
