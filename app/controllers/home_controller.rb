class HomeController < ApplicationController
  def index
    @wines = Wine.validated.last(5)
    @tastings = Tasting.last(3)
  end
  
  def about
  end
  
  def why
  end
end
