# -*- coding: utf-8 -*-

estate_name = 'Domaine de Barroubio'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Raymond Miquel", address: "", zip_code: "34360", town: "Saint-Jean-de-Minervois", country: "France", phone: "04 67 38 14 06 ", fax: "04 67 38 14 06 ", email: "barroubio@barroubio.fr", www: "http://www.barroubio.fr/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Classique', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Muscat de Saint-Jean-de-Minervois').id, wine_color: 'natural_sweet', validation: true, info: ''},
    {name: 'Dieuvaille', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Muscat de Saint-Jean-de-Minervois').id, wine_color: 'natural_sweet', validation: true, info: ''},
    {name: 'Cuvée Bleue', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Muscat de Saint-Jean-de-Minervois').id, wine_color: 'natural_sweet', validation: true, info: ''},
    {name: 'Cuvée Nicolas', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Muscat de Saint-Jean-de-Minervois').id, wine_color: 'natural_sweet', validation: true, info: ''},
    {name: "Grain d'Automne", estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Vin de Pays d'Oc").id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Muscat sec', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Vin de Pays d'Oc").id, wine_color: 'white', validation: true, info: ''},
    {name: 'Font dels Muscles', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name("Vin de Pays d'Oc").id, wine_color: 'white', validation: true, info: ''},
    {name: 'Rosé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Minervois').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Rouge', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Minervois').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Marie-Thérèse', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Minervois').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Jean Miquel', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Minervois').id, wine_color: 'red', validation: true, info: ''},
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
