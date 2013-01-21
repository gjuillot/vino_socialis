class HomeController < ApplicationController
  def index
    @wines = Wine.validated.last(5)
    @tastings = Tasting.last(3)
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
