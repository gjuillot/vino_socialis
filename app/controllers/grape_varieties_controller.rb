class GrapeVarietiesController < ApplicationController
  
  load_and_authorize_resource
  
  def index
    @grape_varieties = GrapeVariety.validated
  end

  def show
    @wines = @grape_variety.wines
  end
  
  def edit
  end

  def update
    if @grape_variety.update_attributes(params[:grape_variety])
      redirect_to @grape_variety, notice: 'grape_variety_updated'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @grape_variety.destroy if @grape_variety.wines.empty?
    redirect_to sheets_moderations_path
  end
  
  def validate
    @grape_variety.validation = true
    @grape_variety.save
    redirect_to sheets_moderations_path
  end
  
  def replace
    @grape_varieties = GrapeVariety.validated
    @for_replacement = GrapeVariety.find(params[:id])
    render action: 'index'
  end
  
  def do_replace
    @replace = GrapeVariety.find(params[:id])
    @replace_by = GrapeVariety.find(params[:by])
    @replace.wines.each do |w|
      w.grape_varieties = w.grape_varieties.push(@replace_by).reject {|gv| gv.id = @replace.id}
    end
    @replace.destroy
    redirect_to sheets_moderations_path
  end
end
