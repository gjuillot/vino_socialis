class EstatesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /estates
  def index
    if params[:replaced]
      @replaced = Estate.find(params[:replaced])
      @estates = Estate.where('id != ?', @replaced.id).order('random()').limit(20)
    else
      @estates = Estate.order('random()').limit(20)
    end
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      if params[:replaced]
        @replaced = Estate.find(params[:replaced])
        @estates = Estate.where("name ILIKE ? AND id != ?", "%#{@searched}%", @replaced.id).order('name')
      else
        @estates = Estate.where("name ILIKE ?", "%#{@searched}%").order('name')
      end
      render action: 'index'
    end
  end

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
      redirect_to @estate, notice: 'estate was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /estates/1
  def update
    if @estate.update_attributes(params[:estate])
      redirect_to @estate, notice: 'estate was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /estates/1
  def destroy
    @estate.destroy
    redirect_to estates_url
  end
  
  # POST /estates/1/validate
  def validate
    @estate.validation = true
    if @estate.save
      redirect_to @estate, notice: 'estate was successfully validated.'
    else
      redirect_to @estate, error: 'estate was not successfully validated.'
    end
  end
  
  # POST /estates/1/unvalidate
  def unvalidate
    @estate.validation = false
    if @estate.save
      redirect_to @estate, notice: 'estate was successfully unvalidated.'
    else
      redirect_to @estate, error: 'estate was not successfully unvalidated.'
    end
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
