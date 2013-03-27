class Vintage < ActiveRecord::Base
  belongs_to :user

  AREAS = [
    'Alsace',
    'Beaujolais',
    'Bordeaux rouge', 'Bordeaux liquoreux', 'Bordeaux sec',
    'Bourgogne rouge', 'Bourgogne blanc',
    'Champagne',
    'Jura',
    'Languedoc-Roussillon',
    'Loire rouge', 'Loire liquoreux', 'Loire sec',
    'Provence',
    'Rhone (nord)', 'Rhone (sud)',
    'Sud-Ouest rouge', 'Sud-Ouest liquoreux'
    ]
end
