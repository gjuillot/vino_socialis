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
    total_row = params[:total_row]
    total_column = params[:total_column]
    row = params[:row]
    column = params[:column]
    WineRackPosition.create(:wine_rack => @wine_rack, :bottle => bottle, :total_row => total_row, :total_column => total_column, :row => row, :column => column)
    redirect_to @wine_rack, notice: 'Bottle was successfully placed.'
  end
  
  private
  def init_wine_rack_positions
    one_compartment = Array.new(@wine_rack.rows) { |i| [nil]*@wine_rack.columns }
    one_row = Array.new(@wine_rack.total_columns) { |i| one_compartment }
    @positions = Array.new(@wine_rack.total_rows) { |i| one_row }
    WineRackPosition.where('wine_rack_id = ?', @wine_rack.id).each do |p|
      @positions[p.total_row][p.total_column][p.row][p.column] = p
    end
  end
end
