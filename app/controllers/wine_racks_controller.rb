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
    if (@wine_rack.layout == 'front_back_cellar') || (@wine_rack.layout == 'front_back_cellar_2')
      @wine_rack.total_rows = 1
      @wine_rack.total_columns = 2
    end
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
    total_row = params[:total_row]
    total_column = params[:total_column]
    row = params[:row]
    column = params[:column]
    WineRackPosition.create(:wine_rack => @wine_rack, :bottle => bottle, :total_row => total_row, :total_column => total_column, :row => row, :column => column)
    redirect_to @wine_rack, notice: 'Bottle was successfully placed.'
  end
  
  private
  def init_wine_rack_positions
    @positions = Array.new(@wine_rack.total_rows) { Array.new(@wine_rack.total_columns) { Array.new(@wine_rack.rows) { [nil]*@wine_rack.columns } } }
    WineRackPosition.where('wine_rack_id = ?', @wine_rack.id).each do |p|
      @positions[p.total_row][p.total_column][p.row][p.column] = p
    end
  end
end
