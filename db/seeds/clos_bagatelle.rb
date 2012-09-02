# -*- coding: utf-8 -*-

estate_name = 'Clos Bagatelle'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Christine Deleuze", address: "", zip_code: "34360", town: "Saint-Chinian", country: "France", phone: "04 67 93 61 63", fax: "", email: "closbagatelle@wanadoo.fr", www: "http://www.closbagatelle.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Cuvée Tradition', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Camille et Juliette', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'La Veillée d\'Automne', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'La Terre de Mon Père', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Je Me Souviens', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Blanc', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Saint-Chinian').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Muscat', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Muscat de Saint-Jean-de-Minervois').id, wine_color: 'natural_sweet', validation: true, info: ''}
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
