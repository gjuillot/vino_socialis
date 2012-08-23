class PairingsController < ApplicationController
  
  def index
    @pairings = Pairing.order('id DESC').limit(10)
    @dishes = Pairing.select(:dish).map { |p| p.dish }  
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      @pairings = Pairing.where('dish = ?', @searched).order('note DESC')
      @dishes = Pairing.select(:dish).map { |p| p.dish }  
      render action: 'index'
    end
  end
end