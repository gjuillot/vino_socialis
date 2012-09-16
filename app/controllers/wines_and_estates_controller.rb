class WinesAndEstatesController < ApplicationController
  
  # GET /estates
  def index
    if params[:replaced_estate]
      @replaced_estate = Estate.find(params[:replaced_estate])
      @estates = Estate.where('id != ?', @replaced_estate.id).where('validation = ?' , true).order('random()').limit(5)
    else
      @estates = Estate.order('random()').limit(5)
    end
    if params[:replaced_wine]
      @replaced_wine = Wine.find(params[:replaced_wine])
      @wines = Wine.where('id != ?', @replaced_wine.id).where('validation = ?' , true).order('random()').limit(5)
    else
      @wines = Wine.order('random()').limit(5)
    end
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      if params[:replaced_estate]
        @replaced_estate = Estate.find(params[:replaced_estate])
        @estates = Estate.where('"wines".id != ?', @replaced_estate.id).where('"wines".validation = ?' , true).order('random()').limit(5)
      else
        @estates = Estate.order('random()').limit(5)
      end
      if params[:replaced_wine]
        @replaced_wine = Wine.find(params[:replaced_wine])
        @wines = Wine.where('"wines".id != ?', @replaced_wine.id).where('"wines".validation = ?' , true).order('random()').limit(5)
      else
        @wines = Wine.order('random()').limit(5)
      end
      @estates = @estates.where("name LIKE ?", "%#{@searched}%").order('name')
      @wines = @wines.joins(:estate).where('"wines".name LIKE ? OR "estates".name LIKE ?', "%#{@searched}%", "%#{@searched}%").order('"estates".name, "wines".name')
      render action: 'index'
    end
  end

end
