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
      redirect_to @user, notice: 'user_updated'
    else
      render action: "edit"
    end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  def become
    return unless current_user.admin?
    sign_in(:user, User.find(params[:id]), :bypass => true)
    redirect_to root_path
  end
  
  def dashboard
    @bottles = Bottle.remain(@user).select('SUM(remaining_quantity) AS total').first.total
    @bottles = 0 if (@bottles.nil?)
    @oldest = Bottle.remain(@user).where('vintage > 0').reorder('vintage ASC').first
    @most_expensive = Bottle.remain(@user).reorder('current_value DESC').first
    @tags = @user.bottles.tag_counts_on(:tags)
    @colors = Bottle.remain(@user).joins(:wine).select('"wines".wine_color AS color, SUM(remaining_quantity) AS total').group('"wines".wine_color').reorder('total DESC')
    @tastings = Tasting.where('"tastings".user_id = ?', @user.id).count
    @pairings = Pairing.joins(:tasting).where('"tastings".user_id = ?', @user.id).count
    @wines = Wine.validated.where('"wines".user_id = ?', @user.id).count
    @ages = {
      'best' => Bottle.remain(@user).best.select('SUM(remaining_quantity) AS total').first.total || 0,
      'ready' => Bottle.remain(@user).ready.select('SUM(remaining_quantity) AS total').first.total || 0,
      'too_late' => Bottle.remain(@user).too_late.select('SUM(remaining_quantity) AS total').first.total || 0,
      'too_soon' => Bottle.remain(@user).too_soon.select('SUM(remaining_quantity) AS total').first.total || 0,
    }
  end
  
  def stat
    respond_to do |format|
      format.html { stat_html }
      format.json { stat_json }
    end
  end
  
  def tags
    respond_to do |format|
      tags = @user.bottles.tag_counts.where("tags.name LIKE ?", "%#{params[:q]}%").map(&:attributes)
      tags << {:name => params[:q], :id => "CREATE_#{params[:q]}_END"} unless @user.bottles.tag_counts.where("tags.name = ?", params[:q]).count > 0
      format.json { render :json => tags }
    end
  end
  
  private
  def stat_html
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
    render 'stat'
  end
  
  private
  def stat_json
    datas = {
      name: "root",
      children: []
    }
    if params['areas'] or params['colors'] or params['vintages'] or params['purchase_years']
      @user.remaining_bottles.each do |b|
        vintage = view_context.formated_vintage(b.vintage, false).to_s
        color = t(b.wine.wine_color, scope: 'wine.color')
        area = b.wine.area.name
        region = b.wine.area.region.name
        country = b.wine.area.region.country.name
        purchase_year = b.date.year
        
        leaf = get_or_create_leaf(datas, color) if params['colors']
        leaf = get_or_create_leaf(datas, vintage) if params['vintages']
        leaf = get_or_create_leaf(datas, purchase_year) if params['purchase_years']
        
        if params['areas']
          country = get_or_create_child datas, country
          region = get_or_create_child country, region
          area = get_or_create_child region, area
          color = get_or_create_child area, color
          leaf = get_or_create_leaf color, vintage
        end
        
        leaf[:size] += b.remaining_quantity
        leaf[:bottles] << b.id
      end
    elsif params['consumptions']
      @user.consumptions.each do |c|
        reason = t(c.reasons, scope: 'consumptions.reasons')
        get_or_create_leaf(datas, reason)[:size] += c.quantity unless c.quantity.nil?
      end
    end
    render :json => datas
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
    data[:children].push( {name: new_child, size: 0, bottles: []} ) unless children_has?(data, new_child)
    return data[:children].select {|c| c[:name] == new_child}.first
  end
  
end
