# -*- coding: utf-8 -*-

estate_name = 'Clos de l\'Epinay'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Luc et Marie-Claire Dumange", address: "", zip_code: "37210", town: "Vouvray", country: "France", phone: "02.47.52.61.90", fax: "02.47.52.71.31", email: "domaine.clos.epinay@cegetel.net", www: "http://www.vinvouvray.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Classique Brut', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Classique Demi-Sec', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Tête de Cuvée', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Cuvée Pauline', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Touraine').id, wine_color: 'sparkling_rose', validation: true, info: ''},
    {name: 'Sec', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Cuvée Marcus', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Demi-Sec', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Moëlleux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Grande Réserve', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sweet_white', validation: true, info: ''},
    {name: 'Doux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Vouvray').id, wine_color: 'sweet_white', validation: true, info: ''}
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

