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
    @bottles = 0
    @price = 0
    @current_value = 0
    @user.remaining_bottles.each do |b|
      @bottles += b.remaining_quantity
      @price += b.price
      @current_value += b.current_value
      
      @oldest = b if @oldest.nil? or (b.vintage > 0 and b.vintage < @oldest.vintage)
      @most_expensive = b if @most_expensive.nil? or b.current_value > @most_expensive.current_value
    end
  end
  
  def stat_json
    @areas = {
      name: "areas",
      children: []
    }
    @colors = {
      name: "colors",
      children: []
    }
    @vintages = {
      name: "vintages",
      children: []
    }
    @user.remaining_bottles.each do |b|
      vintage = view_context.formated_vintage(b.vintage, false).to_s
      color = t(b.wine.wine_color, scope: 'wine.color')
      area = b.wine.area.name
      region = b.wine.area.region.name
      country = b.wine.area.region.country.name
      
      get_or_create_leaf(@colors, color)[:size] += b.remaining_quantity
      get_or_create_leaf(@vintages, vintage)[:size] += b.remaining_quantity
      
      country = get_or_create_child @areas, country
      region = get_or_create_child country, region
      area = get_or_create_child region, area
      color = get_or_create_child area, color
      vintage = get_or_create_leaf color, vintage
      vintage[:size] += b.remaining_quantity
    end
    respond_to do |format|
      format.json { render :json => {areas: @areas, colors: @colors, vintages: @vintages} }
    end
  end
  
  private
  def children_has?(data, searched)
    names = data[:children].map {|c| c[:name]}
    return names.include? searched
  end
  
  private
  def get_or_create_child(data, new_child)
    data[:children].push( {name: new_child, children: []} ) unless children_has?(data, new_child)
    return data[:children].select {|c| c[:name] == new_child}.first
  end
  
  private
  def get_or_create_leaf(data, new_child)
    data[:children].push( {name: new_child, size: 0} ) unless children_has?(data, new_child)
    return data[:children].select {|c| c[:name] == new_child}.first
  end
  
end
