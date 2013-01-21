class HomeController < ApplicationController
  def index
    if (!current_user.nil?)
      redirect_to dashboard_user_path(current_user)
    else
      @wines = Wine.validated.last(5)
      @tastings = Tasting.last(3)
    end
  end
  
  def discover
    @areas = Area.reorder("random()").limit(5)
    @grape_varieties = GrapeVariety.reorder("random()").limit(7)
    @definition = Glossary.reorder("random()").limit(1).first
  end
  
  def about
  end
  
  def why
  end
end
