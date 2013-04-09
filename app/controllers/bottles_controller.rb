class BottlesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /bottles
  def index
    @bottles = Bottle.remain(current_user)

    if (@bottles.empty?)
      redirect_to new_bottle_path
    end
    
    if params[:maturity]
      if params[:maturity] == 'best'
        @bottles = @bottles.best
      elsif params[:maturity] == 'too_late'
        @bottles = @bottles.too_late
      elsif params[:maturity] == 'too_soon'
        @bottles = @bottles.too_soon
      elsif params[:maturity] == 'ready'
        @bottles = @bottles.ready
      end
    end
    
    if params[:color]
      @bottles = @bottles.color(params[:color])
    end
    
    if params[:tag]
      @bottles = @bottles.tagged_with(params[:tag])
    end
    
    if params[:wine_rack_id] && (params[:wine_rack_id] != '0')
      @bottles = @bottles.rack(Integer(params[:wine_rack_id])).in_rack_as_quantity
    else
      @bottles = @bottles.remaining_as_quantity
    end
    
    if params[:ids]
      @bottles = @bottles.find(params[:ids].split(",").map { |s| s.to_i })
    end
    
    if params[:search_attribute] == 'wine'
      @bottles = @bottles.name_like(params[:search_value])
    elsif params[:search_attribute] == 'area'
      @bottles = @bottles.area_like(params[:search_value])
    elsif params[:search_attribute] == 'comments'
      @bottles = @bottles.comments_like(params[:search_value])
    end
    
    if params[:order_attribute] == 'name'
      @bottles = @bottles.wine_order(params[:order_sens])
    elsif params[:order_attribute] == 'area'
      @bottles = @bottles.area_order(params[:order_sens])
    elsif params[:order_attribute] == 'wine_color'
      @bottles = @bottles.color_order(params[:order_sens])
    elsif params[:order_attribute]
      @bottles = @bottles.other_order(params[:order_attribute], params[:order_sens])
    end
    
    @racks = WineRack.where('user_id = ?', current_user.id)
  end
  
  def not_placed
    @bottles = Bottle.select('*, remaining_quantity AS quantity').where('bottles.user_id = ? AND remaining_quantity > 0', current_user.id)
    @bottles.each {|b| b.quantity = b.not_placed}
    @bottles = @bottles.find_all {|b| b.quantity > 0}
    @racks = WineRack.where('user_id = ?', current_user.id)
    @not_placed = true
    render action: 'index'
  end
  
  # GET /bottles/1
  def show
    @wine_racks = WineRack.joins(:wine_rack_positions).select('"wine_racks".id, name, count("wine_rack_positions".id) AS positions').where('"wine_rack_positions".bottle_id = ?', @bottle.id).group('"wine_racks".id')
    @all_wine_racks = WineRack.where('user_id = ?', current_user.id)
  end

  # GET /bottles/new
  def new
    if params[:wine].blank?
      redirect_to wines_and_estates_path, alert: 'select_wine_for_new_bottle'
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
      redirect_to @bottle, notice: 'bottle_created'
    else
      @wine = @bottle.wine
      render action: "new"
    end
  end
  
  # PUT /bottles/1
  def update
    if @bottle.update_attributes(params[:bottle])
      redirect_to @bottle, notice: 'bottle_updated'
    else
      @wine = @bottle.wine
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
    if params[:wine_rack_position_id].blank?
      redirect_to new_consumption_path(:bottle => @bottle)
    else
      redirect_to new_consumption_path(:bottle => @bottle, :wine_rack_position_id => params[:wine_rack_position_id])
    end
  end
  
  def place
    redirect_to place_wine_rack_path(WineRack.find(params[:wine_rack_id]), :bottle => @bottle)
  end
  
  def unplace
    WineRackPosition.find(params[:wine_rack_position_id]).destroy()
    redirect_to @bottle , notice: 'bottle_unplaced'
  end
end
