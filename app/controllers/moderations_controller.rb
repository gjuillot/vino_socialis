class ModerationsController < ApplicationController
  
  authorize_resource
  
  def sheets
    @grape_varieties = GrapeVariety.not_validated
    @estates = Estate.not_validated
    @wines = Wine.not_validated
  end
  
  def labels
    @labels = Label.not_validated
  end
end