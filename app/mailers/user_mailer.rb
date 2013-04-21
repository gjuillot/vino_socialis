class UserMailer < ActionMailer::Base
  default :from => "Vinosus <trash@vinosus.fr>"
  
  def estate_validated_email(estate)
    return if !estate.validated?
    @estate = estate
    mail(:to => estate.user.email, :subject => estate.name)
  end
end
