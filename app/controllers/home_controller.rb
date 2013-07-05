class HomeController < ApplicationController
  def index
    if (!current_user.nil?)
      redirect_to dashboard_user_path(current_user)
    else
      @wines = Wine.unscoped.validated.last(5)
      @tastings = Tasting.last(4)
    end
  end
  
  def discover
    @areas = Area.reorder("random()").limit(5)
    @grape_varieties = GrapeVariety.reorder("random()").limit(7)
    @definitions = Glossary.reorder("random()").limit(2)
    @vintages = Vintage.select("area, year, count(user_id) AS users, avg(note) AS note").group("area, year").reorder("random()").limit(8)
  end
  
  def temperature
  end
  
  def track
  end
  
  def share
    @sheeters = Wine.unscoped.validated.select('user_id, COUNT(id) AS total').group('user_id').order('total DESC').limit(3)
    @sheeters = @sheeters.map {|wine| {:name => wine.user.name, :count => wine.total}}
    @tasters = Tasting.unscoped.select('user_id, COUNT(id) AS total').group('user_id').order('total DESC').limit(3)
    @tasters = @tasters.map {|tasting| {:name => tasting.user.name, :count => tasting.total}}
  end
  
  def about
  end
  
  def why
  end
  
  def newcomer
    @estate = Estate.find(2)
    @wine = @estate.wines.first
  end
  
  def sitemap
    @estates = Estate.validated
    @wines = Wine.validated
    @books = Book.validated
    respond_to do |format|
       format.xml
    end
  end
end
