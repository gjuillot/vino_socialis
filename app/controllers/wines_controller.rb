class WinesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /wines
  def index
    @wines = Wine.order('random()').limit(20)
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      @wines = Wine.where("name LIKE ?", "%#{@searched}%").order('name')
      render action: 'index'
    end
  end

  # GET /wines/1
  def show
  end

  # GET /wines/new
  def new
    @estate_id = params[:estate_id]
    @estate_name = params[:estate_name]
    @areas = Area.all
    @wine_colors = WineColor.all
  end

  # GET /wines/1/edit
  def edit
    @estate_id = @wine.estate.id
    @estate_name = @wine.estate.name
    @areas = Area.all
    @wine_colors = WineColor.all
  end

  # POST /wines
  def create
    @wine.user_id = current_user.id
    @wine.validation = false
    if @wine.save
      redirect_to @wine, notice: 'Wine was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /wines/1
  def update
    if @wine.update_attributes(params[:wine])
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
  
  # POST /wines/1/validate
  def validate
    @wine.validation = true
    if @wine.save
      redirect_to @wine, notice: 'Wine was successfully validated.'
    else
      redirect_to @wine, error: 'Wine was not successfully validated.'
    end
  end
  
  # POST /wines/1/unvalidate
  def unvalidate
    @wine.validation = false
    if @wine.save
      redirect_to @wine, notice: 'Wine was successfully unvalidated.'
    else
      redirect_to @wine, error: 'Wine was not successfully unvalidated.'
    end
  end
end
