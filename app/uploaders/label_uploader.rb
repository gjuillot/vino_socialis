# encoding: utf-8

class LabelUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :standard do
    process :convert => 'jpg'
  end
  
  version :big do
    resize_to_fit(200, 200)
  end
  
  version :medium do
    resize_to_fit(160, 160)
  end
  
  version :small do
    resize_to_fit(120, 120)
  end
  
  version :mini do
    resize_to_fit(80, 80)
  end
  
  version :micro do
    resize_to_fit(40, 40)
  end
end
