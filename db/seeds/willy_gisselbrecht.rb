# -*- coding: utf-8 -*-

estate_name = 'Willy Gisselbrecht'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "", address: "5, Route du Vin", zip_code: "67650", town: "Dambach-la-Ville", country: "France", phone: "03 88 92 41 02", fax: "03 88 92 45 50", email: "info@vins-gisselbrecht.com", www: "http://www.vins-gisselbrecht.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Muscat').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Blanc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Réserve', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Réserve', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: "Rouge d'Alsace", estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Schiefferberg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Réserve spéciale', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Guillaume', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Grès', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling - Muenchberg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling Frankstein', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Gris - Frankstein', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Gewürztraminer - Frankstein', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Sélection de Grains Nobles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Sélection de Grains Nobles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Brut Prestige', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Crémant d'Alsace").id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Blanc de Noirs', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Crémant d'Alsace").id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Brut Prestige', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Crémant d'Alsace").id, wine_color: 'sparkling_rose', validation: true, info: ''}
  ].each do |wine|
    if Wine.unscoped.where('name = ? AND estate_id = ? AND area_id = ? AND wine_color = ?', wine[:name], estate.id, wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine #{estate_name} - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE #{estate_name} - " + wine[:name] + " created"
      end
    end
  end
end

