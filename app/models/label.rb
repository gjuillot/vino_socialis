class Label < ActiveRecord::Base
  belongs_to :wine
  attr_accessible :wine_id, :validation, :image, :remote_image_url
  mount_uploader :image, LabelUploader
  
  scope :validated, where('validation = ?' , true)
  scope :not_validated, where('validation = ?' , false)
end
