class ModerationsController < ApplicationController
  
  authorize_resource
  
  def sheets
    @estates = Estate.where('validation = ?', false)
  end
end