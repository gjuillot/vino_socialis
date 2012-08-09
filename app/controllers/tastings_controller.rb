class TastingsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /tastings
  def index
    @tastings = Tasting.order('id DESC').limit(10)
  end
  
  # GET /tastings/1
  def show
  end

  # GET /tastings/new
  def new
    if params[:wine].blank?
      redirect_to wines_path, notice: 'Please use an existing wine or create a new one.'
    else
      @wine = Wine.find(params[:wine])
    end
  end
  
  # GET /tastings/1/edit
  def edit
    @wine = @tasting.wine
  end

  # POST /tastings
  def create
    @tasting.user_id = current_user.id
    if @tasting.save
      redirect_to @tasting, notice: 'Tasting was successfully created.'
    else
      render action: "new"
    end
  end
  
  # PUT /tastings/1
  def update
    if @tasting.update_attributes(params[:tasting])
      redirect_to @tasting, notice: 'Tasting was successfully updated.'
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
