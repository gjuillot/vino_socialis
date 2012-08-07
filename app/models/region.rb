class Region < ActiveRecord::Base
  default_scope order: 'name ASC'
  belongs_to :country
  has_many :areas, dependent: :destroy
end
