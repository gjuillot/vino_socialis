# -*- coding: utf-8 -*-

estate_name = 'Domaine de la Casa Blanca'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Laurent Escapa, Hervé Levano et Valérie Reig", address: "16, Avenue de la Gare", zip_code: "66650", town: "Banyuls-sur-Mer", country: "France", phone: "04 68 88 12 85", fax: "04 68 88 04 08", email: "herve.levano@wanadoo.fr", www: "", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Collioure', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Collioure').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Les Escoumes', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Banyuls').id, wine_color: 'natural_sweet', validation: true, info: ''},
    {name: 'Roudoulère', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Banyuls').id, wine_color: 'red_port_type', validation: true, info: ''}
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
