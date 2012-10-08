# -*- coding: utf-8 -*-

estate_name = 'Domaine Salvy'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "", address: "Arzac", zip_code: "81140", town: "Cahuzac Sur Vere", country: "France", phone: "05 63 33 97 29", fax: "", email: "", www: "http://www.domainesalvy.free.fr/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Mauzac', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Naïs', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Doux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Fraîcheur Perlée', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Rosé', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'rose', validation: true, info: ''},
    {name: 'Cuvée Léonie', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Méthode Gaillacoise - Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Rouge', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'red', validation: true, info: ''},
    {name: 'L\'Ecole Buissonière', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Gaillac').id, wine_color: 'white', validation: true, info: ''}
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
