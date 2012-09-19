class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User) && resource_or_scope.locale !=  I18n.locale
      I18n.locale = resource_or_scope.locale
    end
    super
  end

end
