class Region < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope order: 'name ASC'
  belongs_to :country
  has_many :areas, dependent: :destroy
  has_many :superficies, dependent: :destroy
  has_many :volumes, dependent: :destroy
  has_many :color_volumes, dependent: :destroy
  has_many :comments, as: :commented
  
  def has_image?
    !image_url.blank?
  end
end
