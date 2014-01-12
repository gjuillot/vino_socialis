class WineColorsController < ApplicationController
  
  def show
    @wine_color = params[:id]
    respond_to do |format|
      format.svg { send_data(view_context.wine_color_icon(@wine_color, tooltip: false), :type=>"image/svg+xml", :disposition=>"inline") }
    end
  end

end
