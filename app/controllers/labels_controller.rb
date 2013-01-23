class LabelsController < ApplicationController
  
  load_and_authorize_resource
  
  def new
    if params[:wine].blank?
      redirect_to wines_and_estates_path, alert: 'select_wine'
      return
    end
    @wine = Wine.find(params[:wine])
  end
  
   def create
    @label.validation = false
    if @label.save
      redirect_to @label.wine, notice: 'label_created'
    else
      redirect_to @label.wine, alert: 'label_not_created'
    end
  end
  
  def validate
    @label.validation = true
    @label.save
    redirect_to labels_moderations_path
  end
  
  def destroy
    @label.destroy
    redirect_to labels_moderations_path
  end
  
end
