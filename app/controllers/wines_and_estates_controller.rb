class WinesAndEstatesController < ApplicationController
  
  # GET /estates
  def index
    if params[:replaced_estate]
      @replaced_estate = Estate.find(params[:replaced_estate])
      @estates = Estate.where('id != ?', @replaced_estate.id).where('validation = ?' , true).order('random()').limit(5)
    else
      @estates = Estate.order('random()').limit(5)
    end
    if params[:replaced_wine]
      @replaced_wine = Wine.find(params[:replaced_wine])
      @wines = Wine.where('id != ?', @replaced_wine.id).where('validation = ?' , true).order('random()').limit(5)
    else
      @wines = Wine.order('random()').limit(5)
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
      @estates = Estate.where("name LIKE ?", "%#{@searched}%").order('name')
      if params[:replaced_estate]
        @replaced_estate = Estate.find(params[:replaced_estate])
        @estates = @estates.where('"wines".id != ?', @replaced_estate.id).where('"wines".validation = ?' , true)
      end
    end
    
    if @display_wine
      @wines = Wine.joins(:estate).where('"wines".name LIKE ? OR "estates".name LIKE ?', "%#{@searched}%", "%#{@searched}%").order('"estates".name, "wines".name')
      if params[:replaced_wine]
        @replaced_wine = Wine.find(params[:replaced_wine])
        @wines = @wines.where('"wines".id != ?', @replaced_wine.id).where('"wines".validation = ?' , true)
      end
      
      if params[:scope] == 'wine'
        if !params[:region][:id].blank? && !params[:area_id].blank?
          @region_id = params[:region][:id]
          @area_id = params[:area_id]
          @region = Region.find(@region_id)
          @wines = @wines.where('"wines".area_id = ?', @area_id)
        elsif !params[:region][:id].blank?
          @region_id = params[:region][:id]
          @region = Region.find(@region_id)
          @wines = @wines.joins(:area).where('"areas".region_id = ?', @region_id)
        end
      end
    end

    @countries = Country.all
    @areas = (@region ? @region.areas : [])
    render action: 'index'
  end

end
