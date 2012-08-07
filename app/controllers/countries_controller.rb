class CountriesController < ApplicationController
  # GET /countries
  def index
    @countries = Country.all
  end

  # GET /countries/1
  def show
    @country = Country.find(params[:id])
    @regions = @country.regions
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  def create
    @country = Country.new(params[:country])

    if @country.save
      redirect_to @country, notice: 'Country was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /countries/1
  def update
    @country = Country.find(params[:id])

    if @country.update_attributes(params[:country])
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /countries/1
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    redirect_to countries_url
  end
end
