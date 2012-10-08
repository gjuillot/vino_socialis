# -*- coding: utf-8 -*-

estate_name = 'Domaine La Grange Léon'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Joël Fernandez", address: "3 rue Caladou", zip_code: "34360", town: "Berlou", country: "France", phone: "04 67 89 73 61", fax: "", email: "fernandez.berlou@wanadoo.fr", www: "", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'D\'une main à l\'autre', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'L\'Audacieux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'L\'Insolent', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'La rose de Laury', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Le petit Marcel', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vin de Pays d\'Oc').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Viognier', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vin de Pays d\'Oc').id, wine_color: 'white', validation: true, info: ''},
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
