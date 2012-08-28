class WineRacksController < ApplicationController
  
  load_and_authorize_resource
  
  def index
    @wine_racks = WineRack.where('user_id = ?', current_user.id)
  end
  
  def show
    init_wine_rack_positions
  end

  def new
  end
  
  def create
    @wine_rack.user_id = current_user.id
    if @wine_rack.save
      redirect_to @wine_rack, notice: 'Rack was successfully created.'
    else
      render action: "new"
    end
  end
  
  def place
    init_wine_rack_positions
    @bottle = Bottle.find(params[:bottle])
  end
  
  def apply_place
    bottle = Bottle.find(params[:bottle])
    row = params[:row]
    column = params[:column]
    WineRackPosition.create(:wine_rack => @wine_rack, :bottle => bottle, :row => row, :column => column)
    redirect_to @wine_rack, notice: 'Bottle was successfully placed.'
  end
  
  private
  def init_wine_rack_positions
    @positions = Array.new(@wine_rack.rows) { |i| [nil]*@wine_rack.columns }
    WineRackPosition.where('wine_rack_id = ?', @wine_rack.id).each do |a|
      @positions[a.row][a.column] = a
    end
  end
end
