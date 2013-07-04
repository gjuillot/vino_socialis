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
  
  def books
    @books = Book.not_validated
  end
  
  def clean
    @wines = Wine.unscoped.where('validation = ? AND created_at < ?', false, Date.current().months_ago(1)).select(&:destroyable?)
    @estates = Estate.unscoped.where('validation = ? AND created_at < ?', false, Date.current().months_ago(1)).select(&:destroyable?)
  end
  
  def proposals
    @proposals = Proposal.opened
  end
end