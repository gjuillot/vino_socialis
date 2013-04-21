class UserMailer < ActionMailer::Base
  helper :wines
  default :from => "Vinosus <trash@vinosus.fr>"
  
  def estate_validated_email(estate)
    return if !estate.validated?
    @estate = estate
    mail(:to => estate.user.email, :subject => estate.name)
  end
  
  def wine_validated_email(wine)
    return if !wine.validated?
    @wine = wine
    mail(:to => wine.user.email, :subject => "#{wine.estate.name} - #{wine.name} - #{wine.area.name}")
  end
end
