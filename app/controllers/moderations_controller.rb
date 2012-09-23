class ModerationsController < ApplicationController
  
  authorize_resource
  
  def sheets
    @estates = Estate.not_validated
    @wines = Wine.not_validated
  end
end