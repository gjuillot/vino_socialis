# -*- coding: utf-8 -*-

estate_name = 'Mas de Cynanque'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "", address: "Route d'Assignan", zip_code: "34310", town: "Cruzy", country: "France", phone: "04 67 25 01 34", fax: "04 67 25 01 34", email: "contact@masdecynanque.com", www: "http://www.masdecynanque.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Acutum', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Althéa', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Côteaux du Languedoc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Fleur de Cynanque', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Fleur de Cynanque', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Nominaris', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Plein Grès', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''}
  ].each do |wine|
    if Wine.where('name = ? AND area_id = ? AND wine_color = ?', wine[:name], wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine #{estate_name} - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE #{estate_name} - " + wine[:name] + " created"
      end
    end
  end
end

