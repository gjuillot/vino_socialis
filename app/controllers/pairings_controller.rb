class PairingsController < ApplicationController
  
  def index
    @pairings = Pairing.order('id DESC').limit(10)
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      @pairings = Pairing.where('dish = ?', @searched).order('note DESC')
      @best_matches = best_matches(@pairings, current_user.bottles)
      render action: 'index'
    end
  end
  
  private
  def best_matches(pairings, bottles)
    notes = pairing_notes(pairings, bottles.map(&:wine).uniq)
    notes.sort! {|a,b| b[:note] <=> a[:note]}
    notes.take(5)
  end
  
  private
  def pairing_notes(pairings, wines)
    wines.map { |wine| {wine: wine, note: pairing_note(wine, pairings)}}
  end
  
  private
  def pairing_note(wine, pairings)
    pairings.map {|pairing| pairing.note * (1 - wine.distance(pairing.tasting.wine))}.sum
  end
end