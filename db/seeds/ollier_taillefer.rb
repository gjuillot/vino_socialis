# -*- coding: utf-8 -*-

estate_name = 'Domaine Ollier-Taillefer'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Luc et Françoise Ollier", address: "Route de Gabian", zip_code: "34320", town: "Fos", country: "France", phone: "04 67 90 24 59", fax: "04 67 90 12 15", email: "ollier.taillefer@wanadoo.fr", www: "http://www.olliertaillefer.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Castel Fossibus', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Faugères').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Grande Réserve', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Faugères').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Collines', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Faugères').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Collines', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Faugères').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Allegro', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Faugères').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Baies de Novembre', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vin de table').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Grenache doux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vin de table').id, wine_color: 'rose', validation: true, info: ''}
  ].each do |wine|
    if Wine.where('name = ? AND estate_id = ? AND area_id = ? AND wine_color = ?', wine[:name], estate.id, wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine #{estate_name} - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE #{estate_name} - " + wine[:name] + " created"
      end
    end
  end
end
