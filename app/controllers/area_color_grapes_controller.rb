class AreaColorGrapesController < ApplicationController

  load_and_authorize_resource
  
  def create
    unless params[:main].nil?
      params[:main].each_key do |main|
        acg = AreaColorGrape.new(params[:area_color_grape])
        acg.grape_variety_id = main.to_i
        acg.main = true
        acg.save
      end
    end
    unless params[:second].nil?
      params[:second].each_key do |second|
        acg = AreaColorGrape.new(params[:area_color_grape])
        acg.grape_variety_id = second.to_i
        acg.main = false
        acg.save
      end
    end
    redirect_to edit_area_path(Area.find(@area_color_grape.area_id))
  end

  def update
    @area_color_grape.update_attributes(params[:area_color_grape])
    redirect_to edit_area_path(Area.find(@area_color_grape.area_id))
  end

  def destroy
    @area_color_grape.destroy
    redirect_to Area.find(@area_color_grape.area_id)
  end
end
