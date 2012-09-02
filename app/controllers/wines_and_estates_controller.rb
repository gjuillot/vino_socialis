class WinesAndEstatesController < ApplicationController
  
  # GET /estates
  def index
    @estates = Estate.order('random()').limit(10)
    @wines = Wine.order('random()').limit(10)
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      @estates = Estate.where("name ILIKE ?", "%#{@searched}%").order('name')
      render action: 'index'
    end
  end

end
