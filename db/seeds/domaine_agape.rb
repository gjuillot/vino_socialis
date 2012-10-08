# -*- coding: utf-8 -*-

estate_name = 'Domaine Agapé'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Vincent Sipp", address: "10 Rue des Tuileries", zip_code: "68340", town: "Riquewihr", country: "France", phone: "03 89 47 94 23", fax: "03 89 47 89 34", email: "", www: "http://www.alsace-agape.fr/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Helios', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Vendanges Tardives', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Sélection de Grains Nobles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Sélection de Grains Nobles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'moelleux_white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'B', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Noir').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Riesling - Schoenenbourg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling - Osterberg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Riesling - Rosacker', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Pinot Gris - Osterberg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Gewürztraminer - Schoenenbourg', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Grand Cru').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Emotion', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Crémant d\'Alsace').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Sylvaner').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Blanc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Riesling').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Pinot Gris').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Gewürztraminer').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Expression', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Alsace Muscat').id, wine_color: 'white', validation: true, info: ''}
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
