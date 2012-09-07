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
      @wine_racks = WineRack.joins(:wine_rack_positions).select('"wine_rack_positions".id AS position_id, name').where('"wine_rack_positions".bottle_id = ?', @bottle.id)
      if params[:wine_rack_position_id]
        @position_id_to_check = Integer(params[:wine_rack_position_id])
      end
    end
  end

  # GET /consumptions/1/edit
  def edit
    @bottle = @consumption.bottle
    @quantity_field_disabled = true
  end
  
  def create
    bottle = @consumption.bottle
    
    quantity = 0
    if params[:rack]
      params[:rack].each do |wine_rack_position_id, on|
        quantity += 1
        WineRackPosition.find(wine_rack_position_id).destroy
      end
    end
    if params[:unracked]
      quantity += params[:unracked].size
    end
    
    bottle.remaining_quantity -= quantity
    if !bottle.save
      render action: "new"
    end
    
    @consumption.user_id = current_user.id
    @consumption.quantity = quantity
    if @consumption.save
      redirect_to consumption_path(@consumption, :new => true)
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
