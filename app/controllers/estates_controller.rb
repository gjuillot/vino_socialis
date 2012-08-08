class EstatesController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /estates
  def index
    @estates = Estate.order('random()').limit(10)
  end
  
  def search
    if params[:q].empty?
      redirect_to action: 'index'
    else
      @searched = params[:q]
      @estates = Estate.where("name LIKE ?", "%#{@searched}%").order('name')
      render action: 'index'
    end
  end

  # GET /estates/1
  def show
  end

  # GET /estates/new
  def new
  end

  # GET /estates/1/edit
  def edit
  end

  # POST /estates
  def create
    @estate.www = 'http://' + @estate.www unless @estate.www.starts_with? 'http://'
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
end
