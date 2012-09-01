# -*- coding: utf-8 -*-

unless Estate.find_by_name('Beck-Hartweg')
  if Estate.create(name: "Beck-Hartweg", user_id: 1, owner: "Florian Beck-Hartweg", address: "5 rue Clémenceau", zip_code: "67650", town: "Dambach-la-Ville", country: "France", phone: "03 88 92 40 20", fax: "06 37 88 47 43", email: "beckhartweg@aliceadsl.fr", www: "http://beckhartweg.free.fr", validation: true)
    puts 'Estate Beck-Hatweg created'
  else
    puts 'COULD NOT CREATE Estate Beck-Hartweg'
  end
end

beck = Estate.find_by_name('Beck-Hartweg')
if beck
  [
    {name: 'Sélection de Grains Nobles', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Cuvée de l\'Ours', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Cuvée de l\'Ours', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'F', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Vieilles Vignes', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Vieilles Vignes', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Auxerrois').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Gewürztraminer - Frankstein', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Gris - Frankstein', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling - Frankstein', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''}, 
    {name: 'Brut Sélection', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Cuvée du Soleil', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Prestige', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Prestige', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Prestige', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Noir', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Riesling', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Blanc', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Blanc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Sylvaner', estate_id: beck.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'white', validation: true, info: ''}
  ].each do |wine|
    if Wine.where('name = ? AND area_id = ? AND wine_color = ?', wine[:name], wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine Beck-Hartweb - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE Wine Beck-Hartweb - " + wine[:name] + " created"
      end
    end
  end
end
