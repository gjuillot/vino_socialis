class ConsumptionsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /consumptions
  def index
    @consumptions = Consumption.where('user_id = ?', current_user.id)
  end

  # GET /consumptions/1
  def show
  end

  # GET /consumptions/new
  def new
    if params[:bottle].blank?
      redirect_to bottles_path, notice: 'Please use an existing bottle.'
    else
      @bottle = Bottle.find(params[:bottle])
      @quantity_field_disabled = false
    end
  end

  # GET /consumptions/1/edit
  def edit
    @bottle = @consumption.bottle
    @quantity_field_disabled = true
  end

  # POST /consumptions
  def create
    bottle = @consumption.bottle
    bottle.remaining_quantity -= @consumption.quantity
    if !bottle.save
      render action: "new"
    end
    
    @consumption.user_id = current_user.id
    if @consumption.save
      redirect_to @consumption, notice: 'Consumption was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /consumptions/1
  def update
    if @consumption.update_attributes(params[:consumption])
      redirect_to @consumption, notice: 'Consumption was successfully updated.'
    else
      render action: "edit"
    end
  end
  
end
