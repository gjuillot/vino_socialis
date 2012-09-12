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
    if params[:q]
      q = "%#{params[:q]}%"
      @glossaries = Glossary.where("word LIKE ? OR definition LIKE ?", q, q)
      @searched = params[:q]
    else
      if params[:l]
        l = params[:l]
      else
        l = 'A'
      end
      @glossaries = Glossary.where("word LIKE ?", "#{l}%")
      @letters = Glossary.all.map {|g| g.word[0].chr}
    end
  end
  
  def update
    if @glossary.update_attributes(params[:glossary])
      redirect_to glossaries_path, notice: 'Definition was successfully updated.'
    else
      render action: "edit"
    end
  end

end
