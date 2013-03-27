class VintagesController < ApplicationController
  
  authorize_resource
  
  def index
    @areas = {}
    raw_areas = Vintage.select("area").group("area").order("area")
    area_position = 0
    raw_areas.each do |area|
      @areas["#{area.area}"] = area_position
      area_position += 1
    end
    
    @vintages = {}
    raw_vintages = Vintage.select("area, year, count(user_id) AS users, avg(note) AS note").group("area, year").order("year DESC")
    raw_vintages.each do |v|
      @vintages[v.year] = Hash.new unless @vintages[v.year]
      @vintages[v.year]["#{v.area}"] = {note: v.note, users: v.users}
    end
    
    if user_signed_in?
      @current_user_vintages = {}
      raw_vintages = Vintage.select("area, year, note").where("user_id = ?", current_user.id).group("area, year").order("year DESC")
      raw_vintages.each do |v|
        @current_user_vintages[v.year] = Hash.new unless @current_user_vintages[v.year]
        @current_user_vintages[v.year]["#{v.area}"] = {note: v.note}
      end
    end
  end
  
  def rate
    @vintage = Vintage.find_or_initialize_by_user_id_and_area_and_year(current_user.id, params[:vintage][:area], params[:vintage][:year])
    @vintage.user = current_user
    @vintage.note = params[:vintage][:note]
    @vintage.save
    redirect_to vintages_path
  end
end
