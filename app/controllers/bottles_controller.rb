class BottlesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /bottles
  def index
    @bottles = Bottle.where('bottles.user_id = ? AND remaining_quantity > 0', current_user.id)
    
    if params[:search_attribute] == 'wine'
      @bottles = @bottles.joins(:wine => :estate).where('"estates".name LIKE "%' + params[:search_value] + '%" OR "wines".name LIKE "%' + params[:search_value] + '%"')
    elsif params[:search_attribute] == 'area'
      @bottles = @bottles.joins(:wine => {:area => {:region => :country}} ).where('"countries".name LIKE "%' + params[:search_value] + '%" OR "regions".name LIKE "%' + params[:search_value] + '%" OR "areas".name LIKE "%' + params[:search_value] + '%"')
    end
    
    if params[:order_attribute] == 'wine'
      @bottles = @bottles.joins(:wine => :estate).order('"estates".name ' + params[:order_sens] + ', "wines".name ' + params[:order_sens])
    elsif params[:order_attribute] == 'area'
      @bottles = @bottles.joins(:wine => {:area => {:region => :country}} ).order('"countries".name ' + params[:order_sens] + ', "regions".name ' + params[:order_sens] + ', "areas".name ' + params[:order_sens])
    elsif params[:order_attribute] == 'color'
      @bottles = @bottles.joins(:wine).order('"wines".wine_color ' + params[:order_sens])
    elsif params[:order_attribute]
      @bottles = @bottles.order(params[:order_attribute] + ' ' + params[:order_sens])
    end
  end
  
  # GET /bottles/1
  def show
  end

  # GET /bottles/new
  def new
    if params[:wine].blank?
      redirect_to wines_path, notice: 'Please use an existing wine or create a new one.'
    else
      @wine = Wine.find(params[:wine])
    end
  end
  
  # GET /bottles/1/edit
  def edit
    @wine = @bottle.wine
  end

  # POST /bottles
  def create
    @bottle.user_id = current_user.id
    @bottle.remaining_quantity = @bottle.initial_quantity
    if @bottle.save
      redirect_to @bottle, notice: 'Bottle was successfully created.'
    else
      render action: "new"
    end
  end
  
  # PUT /bottles/1
  def update
    if @bottle.update_attributes(params[:bottle])
      redirect_to @bottle, notice: 'Bottle was successfully updated.'
    else
      render action: "edit"
    end
  end
  
  # DELETE /bottles/1
  def destroy
    @bottle.destroy
    redirect_to bottles_url
  end
  
  # POST /bottles/1/consume
  def consume
    redirect_to new_consumption_path(:bottle => @bottle)
  end
end
