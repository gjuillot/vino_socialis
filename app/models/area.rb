class Area < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope order: 'name ASC'
  belongs_to :region
  has_many :wines
  
  has_many :superficies, dependent: :destroy
  has_many :volumes, dependent: :destroy
  has_many :color_volumes, dependent: :destroy
  has_many :area_color_grapes, dependent: :destroy
  
  def has_decret?
    !decret_name.blank? and !decret_link.blank?
  end
end
