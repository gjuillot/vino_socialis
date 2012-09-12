class Glossary < ActiveRecord::Base
  default_scope order: 'word ASC'
  default_scope where('lang = ?', I18n.locale)
end
