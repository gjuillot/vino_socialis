class Region < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope order: 'name ASC'
  belongs_to :country
  has_many :areas, dependent: :destroy
end
