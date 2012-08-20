class BottlesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /bottles
  def index
    @bottles = Bottle.where('user_id = ? AND remaining_quantity > 0', current_user.id)
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
