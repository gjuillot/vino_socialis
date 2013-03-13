class NoseFlavor < ActiveRecord::Base
  has_and_belongs_to_many :tastings
  
  def translate
    "tasting.flavor." + name + ".name"
  end
  
  def examples
    "tasting.flavor." + name + ".examples"
  end
  
end
