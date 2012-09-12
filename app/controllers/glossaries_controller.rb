class GlossariesController < ApplicationController
  
  load_and_authorize_resource
  
  def new
  end
  
  def create
    if @glossary.save
      redirect_to glossaries_path, notice: 'Definition was successfully created.'
    else
      render action: "new"
    end
  end
  
  def index
    @glossaries = Glossary.where('lang = ?', I18n.locale)
  end
  
  def update
    if @glossary.update_attributes(params[:glossary])
      redirect_to glossaries_path, notice: 'Definition was successfully updated.'
    else
      render action: "edit"
    end
  end

end
