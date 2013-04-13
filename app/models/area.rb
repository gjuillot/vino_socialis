class Area < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope order: 'name ASC'
  belongs_to :region
  has_many :wines
end
