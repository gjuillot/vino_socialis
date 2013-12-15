class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope order: 'name ASC'
  has_many :regions, dependent: :destroy
  has_many :comments, as: :commented
  
  def has_image?
    !image_url.blank?
  end
end
