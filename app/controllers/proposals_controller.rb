class ProposalsController < ApplicationController
  
  load_and_authorize_resource
  
  def new
    if params[:page].blank?
      redirect_to 'home#index'
      return
    end
    @proposal.page = params[:page]
    @proposal.text = params[:text]
  end
  
   def create
    @proposal.user_id = current_user.id
    if @proposal.save
      redirect_to @proposal, notice: 'proposal_created'
    else
      redirect_to @proposal, alert: 'proposal_not_created'
    end
  end
  
  def show
  end
  
  def close
    @proposal.opened = false
    @proposal.response = params[:proposal][:response]
    @proposal.save
    redirect_to @proposal
  end
  
end
