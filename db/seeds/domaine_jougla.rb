# -*- coding: utf-8 -*-

estate_name = 'Domaine des Jougla'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "", address: "Prades sur Vernazobre", zip_code: "34360", town: "Saint-Chinian", country: "France", phone: "04 67 38 06 02", fax: "04 67 38 17 74", email: "", www: "http://www.domainedesjougla.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Les Tuileries', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Viognier', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vin de Pays des Monts de la Grage').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Viognier - Vendanges Passerillées', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vin de table').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Initiale', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Initiale', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Ancestrale', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Signée', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Viels Arrasics', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
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

