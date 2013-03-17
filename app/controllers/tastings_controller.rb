class TastingsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /tastings
  def index
    if params[:wine].blank?
      @tastings = Tasting.order('id DESC').limit(10)
    else
      @tastings = Tasting.where('wine_id = ?', params[:wine]).order('id DESC')
    end
  end
  
  def me
    @tastings = Tasting.user(current_user).order('id DESC')
    render action: "index"
  end
  
  # GET /tastings/1
  def show
    @pairing = Pairing.find_by_tasting_id(@tasting.id)
  end

  # GET /tastings/new
  def new
    if params[:wine].blank? && params[:consumption].blank?
      redirect_to wines_and_estates_path, alert: 'select_wine'
      return
    end
    if params[:consumption].blank?
      @wine = Wine.find(params[:wine])
    else
      consumption = Consumption.find(params[:consumption])
      @wine = consumption.bottle.wine
      @tasting.vintage = consumption.bottle.vintage
      @tasting.date = consumption.date
    end
  end
  
  # GET /tastings/1/edit
  def edit
    @wine = @tasting.wine
    @vintage = @tasting.vintage
    @pairing = Pairing.find_by_tasting_id(@tasting.id)
  end

  # POST /tastings
  def create
    @tasting.user_id = current_user.id
    if @tasting.save
      if params[:pairing][:dish].blank?
        redirect_to @tasting, notice: 'tasting_created'
      else
        @pairing = Pairing.new(params[:pairing])
        @pairing.tasting_id = @tasting.id
        if @pairing.save
          redirect_to @tasting, notice: 'tasting_pairing_created'
        else
          redirect_to @tasting, alert: 'tasting_created_but_not_pairing'
        end
      end
    else
      render action: "new"
    end
  end
  
  # PUT /tastings/1
  def update
    existing_pairing = Pairing.find_by_tasting_id(@tasting.id)
    if existing_pairing
      if params[:pairing][:dish].blank?
        existing_pairing.destroy
      else
        existing_pairing.dish = params[:pairing][:dish]
        existing_pairing.note = params[:pairing][:note]
        existing_pairing.save
      end
    elsif !params[:pairing][:dish].blank?
      pairing = Pairing.new(params[:pairing])
      pairing.tasting_id = @tasting.id
      pairing.save
    end
    
    if @tasting.update_attributes(params[:tasting])
      redirect_to @tasting, notice: 'tasting_updated'
    else
      render action: "edit"
    end
  end
  
  # DELETE /tastings/1
  def destroy
    @tasting.destroy
    redirect_to tastings_url
  end
  
end
