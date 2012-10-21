class WinesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /wines/1
  def show
  end

  # GET /wines/new
  def new
    if params[:estate_id].blank?
      redirect_to wines_and_estates_path, notice: 'Please use an existing estate or create a new one.'
    else
      @estate_id = params[:estate_id]
      @estate_name = params[:estate_name]
      @countries = Country.all
      @areas = []
    end
  end

  # GET /wines/1/edit
  def edit
    @estate_id = @wine.estate.id
    @estate_name = @wine.estate.name
    @countries = Country.all
    @region = @wine.area.region
    @areas = Area.all
  end

  # POST /wines
  def create
    @wine.user_id = current_user.id
    @wine.validation = false
    if @wine.save
      @wine.grape_varieties = params[:wine_grape_varieties].reject(&:blank?).map {|n| GrapeVariety.find_or_create_by_name(n)}
      redirect_to @wine, notice: 'Wine was successfully created.'
    else
      @estate_id = @wine.estate_id
      @estate_name = Estate.find(@estate_id).name
      @countries = Country.all
      @region = Region.find(params[:region][:id]) unless params[:region][:id].blank?
      @areas = @region ? @region.areas : []
      render action: "new"
    end
  end

  # PUT /wines/1
  def update
    if @wine.update_attributes(params[:wine])
      @wine.grape_varieties = params[:wine_grape_varieties].reject(&:blank?).map {|n| GrapeVariety.find_or_create_by_name(n)}
      redirect_to @wine, notice: 'Wine was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /wines/1
  def destroy
    @wine.destroy
    redirect_to wines_url
  end
  
  # GET /wines/1/recommand
  def recommand
    recommandation = WineRecommandation.new
    recommandation.wine = @wine
    recommandation.user = current_user
    if recommandation.save
      redirect_to @wine, notice: 'Wine was successfully recommanded.'
    else
      redirect_to @wine, error: 'Wine was not successfully recommanded.'
    end
  end
  
  # GET /wines/1/unrecommand
  def unrecommand
    recommandation = WineRecommandation.where('user_id = ? AND wine_id = ?', current_user.id, @wine.id)
    if recommandation.destroy_all
      redirect_to @wine, notice: 'Wine was successfully unrecommanded.'
    else
      redirect_to @wine, error: 'Wine was not successfully unrecommanded.'
    end
  end
  
  # POST /wines/1/validate
  def validate
    @wine.validation = true
    @wine.save
    redirect_to sheets_moderations_path
  end
  
  # POST /wines/1/unvalidate
  def unvalidate
    @wine.validation = false
    @wine.save
    redirect_to sheets_moderations_path
  end
  
  # POST /wines/1/taste
  def taste
    redirect_to new_tasting_path(:wine => @wine)
  end
  
  # POST /wines/1/encave
  def encave
    redirect_to new_bottle_path(:wine => @wine)
  end
  
  def replace
    @replaced = Wine.find(params[:replaced])
    
    @replaced.bottles.each do |b|
      b.wine_id = @wine.id
      b.save
    end
    
    @replaced.wine_recommandations.each do |b|
      b.wine_id = @wine.id
      b.save
    end
    
    @replaced.destroy
    redirect_to :controller => 'moderations', :action => 'sheets'
  end
end
