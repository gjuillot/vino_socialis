class AreasController < ApplicationController
  
  load_and_authorize_resource
  
  def show
    @wines = Wine.find_all_by_area_id(@area.id)
    @estates = {}
    @wines.each do |wine|
      @estates[wine.estate] = [] unless @estates.has_key? wine.estate
      @estates[wine.estate] << wine.wine_color unless @estates[wine.estate].include? wine.wine_color
    end
    @colors = {}
    @area.area_color_grapes.each do |cg|
      @colors[cg.color] = [] unless @colors.has_key? cg.color
      @colors[cg.color] << cg.grape_variety unless @colors[cg.color].include? cg.grape_variety
    end
    @color_volumes = {}
    @area.color_volumes.each do |color_volume|
      @color_volumes[color_volume.year] = [] unless @color_volumes.has_key? color_volume.year
      @color_volumes[color_volume.year] << {
        :index => 1 + @color_volumes[color_volume.year].size,
        :name => color_volume.color,
        :value => color_volume.volume}
    end
  end

  def for_region_id()
    @areas = Area.find_all_by_region_id(params[:region_id])
    respond_to do |format|
      format.json { render :json => @areas }
    end
  end
  
  def edit
  end
  
  def update
    @area.update_attributes(params[:area])
    redirect_to @area
  end
end
