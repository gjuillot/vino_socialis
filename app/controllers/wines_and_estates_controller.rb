class WinesAndEstatesController < ApplicationController
  
  # GET /estates
  def index
    if params[:replaced_estate]
      @replaced_estate = Estate.find(params[:replaced_estate])
      @estates = Estate.random.not(params[:replaced_estate]).validated
    else
      @estates = Estate.random
    end
    if params[:replaced_wine]
      @replaced_wine = Wine.find(params[:replaced_wine])
      @wines = Wine.random.not(params[:replaced_wine]).validated
    else
      @wines = Wine.random
    end
    @countries = Country.all
    @areas = []
    @display_estate = true
    @display_wine = true
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
      return
    end
    
    @display_estate = (params[:scope] != 'wine')
    @display_wine = (params[:scope] != 'estate')
    @searched = params[:q]
    
    if @display_estate
      @estates = Estate.like(@searched)
      if params[:replaced_estate]
        @replaced_estate = Estate.find(params[:replaced_estate])
        @estates = @estates.not(params[:replaced_estate]).validated
      end
      @estates = @estates.on_page(params[:estate_page])
    end
    
    if @display_wine
      @wines = Wine.like(@searched)
      if params[:replaced_wine]
        @replaced_wine = Wine.find(params[:replaced_wine])
        @wines = @wines.not(params[:replaced_wine]).validated
      end
      
      if params[:scope] == 'wine'
        if !params[:region][:id].blank? && !params[:area_id].blank?
          @region_id = params[:region][:id]
          @area_id = params[:area_id]
          @region = Region.find(@region_id)
          @wines = @wines.area(@area_id)
        elsif !params[:region][:id].blank?
          @region_id = params[:region][:id]
          @region = Region.find(@region_id)
          @wines = @wines.region(@region_id)
        end
      end
      @wines = @wines.on_page(params[:wine_page])
    end

    @countries = Country.all
    @areas = (@region ? @region.areas : [])
    render action: 'index'
  end

end
