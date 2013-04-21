class EstatesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /estates/1
  def show
  end

  # GET /estates/new
  def new
    if @estate.www = "http://"
      @estate.www = ""
    end
  end

  # GET /estates/1/edit
  def edit
  end

  # POST /estates
  def create
    @estate.www = 'http://' + @estate.www unless @estate.www.blank? or @estate.www.starts_with? 'http://'
    @estate.user_id = current_user.id
    @estate.validation = false
    if @estate.save
      redirect_to @estate, notice: 'estate_created'
    else
      render action: "new"
    end
  end

  # PUT /estates/1
  def update
    if @estate.update_attributes(params[:estate])
      redirect_to @estate, notice: 'estate_updated'
    else
      render action: "edit"
    end
  end

  # DELETE /estates/1
  def destroy
    if @estate.destroyable?
      @estate.destroy
    end
    redirect_to clean_moderations_path
  end
  
  # POST /estates/1/validate
  def validate
    @estate.validation = true
    if @estate.save
      UserMailer.estate_validated_email(@estate).deliver
    end
    redirect_to sheets_moderations_path
  end
  
  # POST /estates/1/unvalidate
  def unvalidate
    @estate.validation = false
    @estate.save
    redirect_to sheets_moderations_path
  end
  
  def replace
    @replaced = Estate.find(params[:replaced])
    @replaced.wines.each do |w|
      w.estate_id = @estate.id
      w.save
    end
    @replaced.destroy
    redirect_to :controller => 'moderations', :action => 'sheets'
  end
end
