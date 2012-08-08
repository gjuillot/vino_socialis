class Country < ActiveRecord::Base
  default_scope order: 'name ASC'
  has_many :regions, dependent: :destroy
  
  def has_image?
    !image_url.blank?
  end
end
