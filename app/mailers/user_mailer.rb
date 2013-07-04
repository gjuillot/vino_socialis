class UserMailer < ActionMailer::Base
  helper :wines
  default :from => "Vinosus <trash@vinosus.fr>"
  
  def estate_validated(estate)
    return if !estate.validated?
    @estate = estate
    mail(:to => estate.user.email, :subject => estate.name)
  end
  
  def estate_replaced(replaced, replaced_by)
    @replaced = replaced
    @replaced_by = replaced_by
    mail(:to => replaced.user.email, :subject => replaced.name)
  end
  
  def wine_validated(wine)
    return if !wine.validated?
    @wine = wine
    mail(:to => wine.user.email, :subject => "#{wine.estate.name} - #{wine.name} - #{wine.area.name}")
  end
  
  def wine_replaced(replaced, replaced_by)
    @replaced = replaced
    @replaced_by = replaced_by
    mail(:to => replaced.user.email, :subject => "#{replaced.estate.name} - #{replaced.name} - #{replaced.area.name}")
  end
  
  def book_validated(book)
    return if !book.validated?
    @book = book
    mail(:to => book.user.email, :subject => book.title)
  end
  
end
