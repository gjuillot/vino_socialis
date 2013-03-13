# -*- coding: utf-8 -*-

['animal', 'wood', 'chemical', 'empyreumatic', 'spice', 'fermentation', 'flower', 'fruit', 'milk', 'mineral', 'sugar', 'vegetal'].each do |name|
  NoseFlavor.find_or_create_by_name(name)
  MouthFlavor.find_or_create_by_name(name)
end
