class UsersController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /users
  def index
    @users = User.where('id != ?', current_user.id)
  end
  
  # GET /users/1
  def show
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # PUT /users/1
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  def stat
    @bottles = @user.remaining_bottles.sum(:remaining_quantity)
    @countries = {}
    @colors = {}
    @vintages = {}
    @user.remaining_bottles.each do |b|
      if @vintages[b.vintage].nil?
        @vintages[b.vintage] = 0
      end
      @vintages[b.vintage] += b.remaining_quantity
      
      if @colors[b.wine.wine_color].nil?
        @colors[b.wine.wine_color] = 0
      end
      @colors[b.wine.wine_color] += b.remaining_quantity
      
      if @countries[b.wine.area.region.country].nil?
        @countries[b.wine.area.region.country] = {}
      end
      
      regions = @countries[b.wine.area.region.country]
      if regions[b.wine.area.region].nil?
        regions[b.wine.area.region] = {}
      end
      
      areas = regions[b.wine.area.region]
      if areas[b.wine.area].nil?
        areas[b.wine.area] = {}
      end
      
      colors = areas[b.wine.area]
      if colors[b.wine.wine_color].nil?
        colors[b.wine.wine_color] = {}
      end
      
      vintages = colors[b.wine.wine_color]
      if vintages[b.vintage].nil?
        vintages[b.vintage] = 0
      end
      vintages[b.vintage] += b.remaining_quantity
    end
  end
end
